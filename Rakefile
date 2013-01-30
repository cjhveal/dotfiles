require 'rake'

desc "Hook our dotfiles into system-standard positions."
task :symlink do
  linkables = Dir.glob('*/**{.symlink}')

  skip_all = false
  overwrite_all = false
  backup_all = false

  linkables.each do |linkable|
    overwrite = false
    backup = false

    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        case STDIN.gets.chomp
        when 'o' then overwrite = true
        when 'b' then backup = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all = true
        when 'S' then skip_all = true
        when 's' then next
        end
      end
      FileUtils.rm_rf(target) if overwrite || overwrite_all
      `mv "$HOME/.#{file}" "$HOME/.#{file}.backup"` if backup || backup_all
    end
    `ln -s "$PWD/#{linkable}" "#{target}"`
  end
end

desc 'Changes the default shell to zsh'
task :zsh do
  puts 'Changing default shell to zsh (needs password):'
  `chsh -s $(which zsh)`
end

desc 'install fonts'
task :fonts do
  puts "Installing fonts"
  `cp ~/.dotfiles/fonts/* ~/Library/Fonts`
end

desc "Updating from git origin"
task :git_pull do
  puts `cd ~/.dotfiles && git pull`
end

desc "Bootstrap and Bundle Install vim plugins"
task :vim_bundle_install do
  system('git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle') unless File.exists? "#{ENV['HOME']}/.vim/bundle/vundle"
  system('vim --noplugin -u ~/.vim/bundles.vim +BundleInstall +qall')
end

desc "Update vim plugins"
task :vim_bundle_update do
  system('vim --noplugin -u ~/.vim/bundles.vim +BundleInstall! +qall')
end


desc "Install .dotfiles painlessly"
task :install => [:symlink, :fonts, :vim_bundle_install, :zsh]

desc "Update .dotfiles"
task :update => [:git_pull, :fonts, :vim_bundle_update]

desc "Uninstall .dotfiles"
task :uninstall do

  Dir.glob('**/*.symlink').each do |linkable|

    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    # Remove all symlinks created during installation
    if File.symlink?(target)
      FileUtils.rm(target)
    end

    # Replace any backups made during installation
    if File.exists?("#{ENV["HOME"]}/.#{file}.backup")
      `mv "$HOME/.#{file}.backup" "$HOME/.#{file}"`
    end

  end
end

task :default => 'update'

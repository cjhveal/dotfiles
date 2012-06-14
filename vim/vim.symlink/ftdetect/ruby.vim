autocmd! BufRead,BufNewFile *.jbuilder,Capfile,Gemfile,Rakefile,Procfile,Guardfile setf ruby
au BufRead,BufNewFile /^[A-Z]+\w*file$/ setf ruby
au BufRead,BufNewFile *.thor set filetype=ruby
au BufRead,BufNewFile Guardfile set filetype=ruby
au BufRead,BufNewFile *.jbuilder setf ruby

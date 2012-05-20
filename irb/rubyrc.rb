module RubyRC
  extend self

  HASH = {:a => 1, :b => 2, :c => 3} unless defined?(HASH)
  ARRAY = %w[one two three four five] unless defined?(ARRAY)


  # Quick benchmarking
 # http://stackoverflow.com/questions/123494/whats-your-favourite-irb-trick/123834#123834
  def bench(repetitions=100, &block)
    require 'benchmark'

    Benchmark.bmbm do |b|
      b.report {repetitions.times &block}
    end
    nil
  end

  # Edit ruby objects in yaml
  require 'yaml'
  def aorta( obj )
    tempfile = File.join('/tmp',"yobj_#{ Time.now.to_i }")
    File.open( tempfile, 'w' ) { |f| f << obj.to_yaml }
    system( "#{ ENV['EDITOR'] || 'vi' } #{ tempfile }" )
    return obj unless File.exists?( tempfile )
    content = YAML::load( File.open( tempfile ) )
    File.delete( tempfile )
    content
  end
end

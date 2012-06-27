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

class Object
  # Lists methods on class excluding those defined by parent classes
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end

# open documentation
# ri 'Array#pop' or Array.ri :pop
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/ # if class isn't specified
      klass = self.kind_of?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end
    puts `ri '#{method}'`
  end
end

# === CONVENIENCE METHODS ===
# Stolen from https://gist.github.com/807492
# Use Array.toy or Hash.toy to get an array or hash to play with
class Array
  def self.toy(n=10, &block)
    block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
  end
end

class Hash
  def self.toy(n=10)
    Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
  end
end

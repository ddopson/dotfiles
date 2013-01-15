require 'irb/completion'
require 'irb/ext/save-history'
require 'readline.so'
require 'time'
require 'git'

IRB.conf[:SAVE_HISTORY] = 20000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
IRB.conf[:AUTO_INDENT] = true

class Object
  # list methods which aren't in superclass
  def own_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end

  def classes(obj = self)
    classes = []
    clazz = obj.class
    while clazz
      classes << clazz
      clazz = clazz.superclass
    end
    return classes
  end

  def h(obj = self)
    width = obj.classes.map {|clazz| clazz.name.length}.max
    obj.classes.each {|clazz|
      if clazz.superclass
        methods = (clazz.instance_methods - clazz.superclass.instance_methods).sort
      else
        methods = clazz.instance_methods
      end
      puts "#{"%-#{width+1}s" % "#{clazz.name}:"} #{methods}"
    }
    nil
  end

  # print documentation
  #
  #   ri 'Array#pop'
  #   Array.ri
  #   Array.ri :pop
  #   arr.ri :pop
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/ # if class isn't specified
      klass = self.kind_of?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end
    system 'ri', method.to_s
  end
end

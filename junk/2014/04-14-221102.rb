SINGLETON_OBJECT = Object.new

class << SINGLETON_OBJECT
  def only_method
    :only_method
  end
end

SingletonClass = SINGLETON_OBJECT.singleton_class

def SingletonClass.instance_get
  SINGLETON_OBJECT
end


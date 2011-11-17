class HomePresenter
  include Enumerable

  def initialize(collection)
    @collection = collection
  end

  def each &block
    @collection.each { |moment| block.call(decorate(moment.subject_type, moment.subject)) } 
  end

  def method_missing(*args, &block)
    @collection.send(*args, &block)
  end

  private

  def decorate(type, moment)
    "#{type}Decorator".constantize.decorate moment
  end

end

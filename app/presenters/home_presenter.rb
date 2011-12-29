# encoding: utf-8
class HomePresenter
  include Enumerable

  def initialize(page)
    @page = page
  end

  def each &block
    collection.each { |moment| block.call moment.subject.decorate } 
  end

  def method_missing(*args, &block)
    collection.send(*args, &block)
  end

  private

  def collection
    @collection ||= Moment.page @page
  end
end

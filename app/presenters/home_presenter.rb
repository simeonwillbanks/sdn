class HomePresenter
  include Enumerable

  def initialize(collection)
    @collection = collection
    moments_factory
  end

  def each &blk
    @moments.each &blk
  end

  private

  def moments_factory
    @moments = @collection.inject([]) do |moments, moment|
      moments << decorate(moment.subject_type, moment.subject)
    end
  end

  def decorate(type, moment)
    "#{type}Decorator".constantize.decorate moment
  end

end

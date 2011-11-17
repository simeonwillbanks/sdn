module IndexPresenter

  def index(params)
    # Paginate on model which extends this module
    self.to_s.split(/(?=[A-Z])/)[0].singularize.constantize.page(params[:page])
  end

end

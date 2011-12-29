# encoding: utf-8
class MomentsPresenter
  def self.decorate_resource?(type, action)
    type == :post && action == 'show' ? false : true
  end
end

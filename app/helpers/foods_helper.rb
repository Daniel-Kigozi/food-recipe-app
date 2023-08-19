module FoodsHelper
  include Rails.application.routes.url_helpers

  def edit_food_link(food)
    link_to 'Edit', edit_food_path(food)
  end
end

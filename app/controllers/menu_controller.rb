class MenuController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    @menu_items = MenuItem.order(:title)
    @categories = Category.order(:name)
  end
end

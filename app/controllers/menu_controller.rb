class MenuController < ApplicationController
  include CurrentCart
  before_action :set_cart
  
  def index
    @menu_items = MenuItem.order(:title)
  end
end

class MenuController < ApplicationController
  def index
    @menu_items = MenuItem.order(:title)
  end
end

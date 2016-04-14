class AddCategoryIdToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :category_id, :foreign_key
  end
end

require 'test_helper'

class MenuItemTest < ActiveSupport::TestCase
  fixtures :menu_items

  test "menu item attributes must not be empty" do
    menu_item = MenuItem.new
    assert menu_item.invalid?
    assert menu_item.errors[:title].any?
    assert menu_item.errors[:description].any?
    assert menu_item.errors[:price].any?
    assert menu_item.errors[:image_url].any?
  end



  test "menu item price must be positive" do
    menu_item = MenuItem.new(title: "Menu Item", description: "Menu item description", image_url: "item.jpg")

    menu_item.price = -1
    assert menu_item.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      menu_item.errors[:price]

    menu_item.price = 0
    assert menu_item.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      menu_item.errors[:price]

    menu_item.price = 1
    assert menu_item.valid?
  end



  def new_menu_item(image_url)
    MenuItem.new(title: "Menu Item", description: "Menu item description", price: 1, image_url: image_url)
  end

  test "image url" do
    ok = %w{ image.gif image.jpg image.png IMAGE.PNG IMAGE.jpg http://a.b.c/x/y/z/image.gif }
    bad = %w{ image.doc image.gif/more image.gif.more image.pdf }

    ok.each do |name|
      assert new_menu_item(name).valid?, "#{name} should be valid"
    end

    bad.each do |name|
      assert new_menu_item(name).invalid?, "#{name} shouln't be valid"
    end
  end



    test "menu item is not valid without a unique title" do
      menu_item = MenuItem.new(title: menu_items(:soda).title, description: "Menu item description", price: 1, image_url: "image.jpg")
      assert menu_item.invalid?
      assert_equal ["title has already been taken"], menu_item.errors[:title]
    end

end

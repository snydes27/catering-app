require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    item = LineItem.new
    item.build_cart
    item.product = products(:ruby)
    item.save!
    session[:cart_id] = item.cart.id
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { billing_address: @order.billing_address, billing_name: @order.billing_name, delivery_address: @order.delivery_address, delivery_date: @order.delivery_date, delivery_fee: @order.delivery_fee, delivery_notes: @order.delivery_notes, delivery_time: @order.delivery_time, discount: @order.discount, discount_code: @order.discount_code, email: @order.email, fuel_fee: @order.fuel_fee, name: @order.name, payment_type: @order.payment_type, phone: @order.phone, total_people: @order.total_people }
    end

    assert_redirected_to store_path

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    patch :update, id: @order, order: { billing_address: @order.billing_address, billing_name: @order.billing_name, delivery_address: @order.delivery_address, delivery_date: @order.delivery_date, delivery_fee: @order.delivery_fee, delivery_notes: @order.delivery_notes, delivery_time: @order.delivery_time, discount: @order.discount, discount_code: @order.discount_code, email: @order.email, fuel_fee: @order.fuel_fee, name: @order.name, payment_type: @order.payment_type, phone: @order.phone, total_people: @order.total_people }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
  
  test "requires item in cart" do
    get :new
    assert_redirected_to store_path
    asset_equal flash[:notice], 'Your Cart is Empty. Please Add Items to Checkout.'
  end
    
end

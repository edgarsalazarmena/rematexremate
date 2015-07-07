require 'test_helper'

class BidsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "unlogged user shouldnt create bid" do
    user = users(:user)
    post :create, bid: { user_id: user.id, product_id: products(:one).id }, product_id: products(:one).id
    assert_equal(2,Bid.count)
    assert_redirected_to landing_page_show_path
  end

  test "guest shouldnt create bids" do
    user = users(:guest)
    sign_in user
    post :create, bid: { product_id: products(:one).id }, product_id: products(:one).id
    assert_redirected_to landing_page_show_path
  end

  test "user should create bids" do
    user = users(:user)
    sign_in user
    post :create, bid: { product_id: products(:one).id }, product_id: products(:one).id
    assert_redirected_to products_path
  end

  test "seller shouldnt create bids" do
    user = users(:seller)
    sign_in user
    post :create, bid: { product_id: products(:one).id }, product_id: products(:one).id
    assert_redirected_to landing_page_show_path
  end

end
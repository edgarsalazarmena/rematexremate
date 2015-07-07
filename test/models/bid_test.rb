require 'test_helper'

class BidTest < ActiveSupport::TestCase

  def setup
    @bid = bids(:one)
  end

  test "should have user" do
    @bid.user = nil
    assert_not @bid.valid?
  end

  test "should have product" do
    @bid.product = nil
    assert_not @bid.valid?
  end

end
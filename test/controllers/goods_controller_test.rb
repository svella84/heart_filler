require 'test_helper'

class GoodsControllerTest < ActionController::TestCase
  test "should get goods_list" do
    get :goods_list
    assert_response :success
  end

  test "should get buy" do
    get :buy
    assert_response :success
  end

end

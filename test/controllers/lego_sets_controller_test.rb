require "test_helper"

class LegoSetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lego_sets_index_url
    assert_response :success
  end

  test "should get new" do
    get lego_sets_new_url
    assert_response :success
  end

  test "should get create" do
    get lego_sets_create_url
    assert_response :success
  end
end

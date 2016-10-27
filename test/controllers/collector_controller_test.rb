require 'test_helper'

class CollectorControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get collector_new_url
    assert_response :success
  end

  test "should get show" do
    get collector_show_url
    assert_response :success
  end

  test "should get edit" do
    get collector_edit_url
    assert_response :success
  end

end

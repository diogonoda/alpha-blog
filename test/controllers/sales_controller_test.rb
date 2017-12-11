require 'test_helper'

class SalesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sales_index_url
    assert_response :success
  end

  test "should get import" do
    get sales_import_url
    assert_response :success
  end

end

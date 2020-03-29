require 'test_helper'

class SuperAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get super_admin_dashboard_url
    assert_response :success
  end

end

require "test_helper"

class EstagiosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get estagios_new_url
    assert_response :success
  end

  test "should get create" do
    get estagios_create_url
    assert_response :success
  end
end

require "test_helper"

class CandidaturasControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get candidaturas_create_url
    assert_response :success
  end
end

require "test_helper"

class OfertasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ofertas_index_url
    assert_response :success
  end

  test "should get new" do
    get ofertas_new_url
    assert_response :success
  end

  test "should get create" do
    get ofertas_create_url
    assert_response :success
  end

  test "should get show" do
    get ofertas_show_url
    assert_response :success
  end

  test "should get edit" do
    get ofertas_edit_url
    assert_response :success
  end

  test "should get update" do
    get ofertas_update_url
    assert_response :success
  end

  test "should get destroy" do
    get ofertas_destroy_url
    assert_response :success
  end
end

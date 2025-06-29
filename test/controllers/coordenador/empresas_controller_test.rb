require "test_helper"

class Coordenador::EmpresasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get coordenador_empresas_index_url
    assert_response :success
  end

  test "should get edit" do
    get coordenador_empresas_edit_url
    assert_response :success
  end

  test "should get update" do
    get coordenador_empresas_update_url
    assert_response :success
  end
end

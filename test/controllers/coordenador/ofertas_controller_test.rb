require "test_helper"

class Coordenador::OfertasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get coordenador_ofertas_index_url
    assert_response :success
  end

  test "should get aprovar" do
    get coordenador_ofertas_aprovar_url
    assert_response :success
  end

  test "should get reprovar" do
    get coordenador_ofertas_reprovar_url
    assert_response :success
  end
end

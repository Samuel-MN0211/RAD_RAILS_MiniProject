require "test_helper"

class Coordenador::AlunosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get coordenador_alunos_index_url
    assert_response :success
  end

  test "should get show" do
    get coordenador_alunos_show_url
    assert_response :success
  end
end

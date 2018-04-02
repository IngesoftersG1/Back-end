require 'test_helper'

class EstadisticasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estadistica = estadisticas(:one)
  end

  test "should get index" do
    get estadisticas_url, as: :json
    assert_response :success
  end

  test "should create estadistica" do
    assert_difference('Estadistica.count') do
      post estadisticas_url, params: { estadistica: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show estadistica" do
    get estadistica_url(@estadistica), as: :json
    assert_response :success
  end

  test "should update estadistica" do
    patch estadistica_url(@estadistica), params: { estadistica: {  } }, as: :json
    assert_response 200
  end

  test "should destroy estadistica" do
    assert_difference('Estadistica.count', -1) do
      delete estadistica_url(@estadistica), as: :json
    end

    assert_response 204
  end
end

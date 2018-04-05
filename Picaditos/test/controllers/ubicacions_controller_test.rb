require 'test_helper'

class UbicacionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ubicacion = ubicacions(:one)
  end

  test "should get index" do
    get ubicacions_url, as: :json
    assert_response :success
  end

  test "should create ubicacion" do
    assert_difference('Ubicacion.count') do
      post ubicacions_url, params: { ubicacion: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show ubicacion" do
    get ubicacion_url(@ubicacion), as: :json
    assert_response :success
  end

  test "should update ubicacion" do
    patch ubicacion_url(@ubicacion), params: { ubicacion: {  } }, as: :json
    assert_response 200
  end

  test "should destroy ubicacion" do
    assert_difference('Ubicacion.count', -1) do
      delete ubicacion_url(@ubicacion), as: :json
    end

    assert_response 204
  end
end

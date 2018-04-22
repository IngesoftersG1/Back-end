require 'test_helper'

class MensajesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mensaje = mensajes(:one)
  end

  test "should get index" do
    get mensajes_url, as: :json
    assert_response :success
  end

  test "should create mensaje" do
    assert_difference('Mensaje.count') do
      post mensajes_url, params: { mensaje: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show mensaje" do
    get mensaje_url(@mensaje), as: :json
    assert_response :success
  end

  test "should update mensaje" do
    patch mensaje_url(@mensaje), params: { mensaje: {  } }, as: :json
    assert_response 200
  end

  test "should destroy mensaje" do
    assert_difference('Mensaje.count', -1) do
      delete mensaje_url(@mensaje), as: :json
    end

    assert_response 204
  end
end

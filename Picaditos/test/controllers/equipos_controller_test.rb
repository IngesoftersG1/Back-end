require 'test_helper'

class EquiposControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equipo = equipos(:one)
  end

  test "should get index" do
    get equipos_url, as: :json
    assert_response :success
  end

  test "should create equipo" do
    assert_difference('Equipo.count') do
      post equipos_url, params: { equipo: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show equipo" do
    get equipo_url(@equipo), as: :json
    assert_response :success
  end

  test "should update equipo" do
    patch equipo_url(@equipo), params: { equipo: {  } }, as: :json
    assert_response 200
  end

  test "should destroy equipo" do
    assert_difference('Equipo.count', -1) do
      delete equipo_url(@equipo), as: :json
    end

    assert_response 204
  end
end

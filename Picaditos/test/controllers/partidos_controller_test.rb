require 'test_helper'

class PartidosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @partido = partidos(:one)
  end

  test "should get index" do
    get partidos_url, as: :json
    assert_response :success
  end

  test "should create partido" do
    assert_difference('Partido.count') do
      post partidos_url, params: { partido: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show partido" do
    get partido_url(@partido), as: :json
    assert_response :success
  end

  test "should update partido" do
    patch partido_url(@partido), params: { partido: {  } }, as: :json
    assert_response 200
  end

  test "should destroy partido" do
    assert_difference('Partido.count', -1) do
      delete partido_url(@partido), as: :json
    end

    assert_response 204
  end
end

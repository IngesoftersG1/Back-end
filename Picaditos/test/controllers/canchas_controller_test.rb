require 'test_helper'

class CanchasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cancha = canchas(:one)
  end

  test "should get index" do
    get canchas_url, as: :json
    assert_response :success
  end

  test "should create cancha" do
    assert_difference('Cancha.count') do
      post canchas_url, params: { cancha: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show cancha" do
    get cancha_url(@cancha), as: :json
    assert_response :success
  end

  test "should update cancha" do
    patch cancha_url(@cancha), params: { cancha: {  } }, as: :json
    assert_response 200
  end

  test "should destroy cancha" do
    assert_difference('Cancha.count', -1) do
      delete cancha_url(@cancha), as: :json
    end

    assert_response 204
  end
end

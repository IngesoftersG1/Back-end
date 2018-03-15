require 'test_helper'

class TablonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tablon = tablons(:one)
  end

  test "should get index" do
    get tablons_url, as: :json
    assert_response :success
  end

  test "should create tablon" do
    assert_difference('Tablon.count') do
      post tablons_url, params: { tablon: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show tablon" do
    get tablon_url(@tablon), as: :json
    assert_response :success
  end

  test "should update tablon" do
    patch tablon_url(@tablon), params: { tablon: {  } }, as: :json
    assert_response 200
  end

  test "should destroy tablon" do
    assert_difference('Tablon.count', -1) do
      delete tablon_url(@tablon), as: :json
    end

    assert_response 204
  end
end

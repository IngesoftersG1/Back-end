require 'test_helper'

class TorneosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @torneo = torneos(:one)
  end

  test "should get index" do
    get torneos_url, as: :json
    assert_response :success
  end

  test "should create torneo" do
    assert_difference('Torneo.count') do
      post torneos_url, params: { torneo: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show torneo" do
    get torneo_url(@torneo), as: :json
    assert_response :success
  end

  test "should update torneo" do
    patch torneo_url(@torneo), params: { torneo: {  } }, as: :json
    assert_response 200
  end

  test "should destroy torneo" do
    assert_difference('Torneo.count', -1) do
      delete torneo_url(@torneo), as: :json
    end

    assert_response 204
  end
end

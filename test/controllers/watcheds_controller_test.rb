require 'test_helper'

class WatchedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @watched = watcheds(:one)
  end

  test "should get index" do
    get watcheds_url, as: :json
    assert_response :success
  end

  test "should create watched" do
    assert_difference('Watched.count') do
      post watcheds_url, params: { watched: { movie_id: @watched.movie_id, user_id: @watched.user_id, watched: @watched.watched } }, as: :json
    end

    assert_response 201
  end

  test "should show watched" do
    get watched_url(@watched), as: :json
    assert_response :success
  end

  test "should update watched" do
    patch watched_url(@watched), params: { watched: { movie_id: @watched.movie_id, user_id: @watched.user_id, watched: @watched.watched } }, as: :json
    assert_response 200
  end

  test "should destroy watched" do
    assert_difference('Watched.count', -1) do
      delete watched_url(@watched), as: :json
    end

    assert_response 204
  end
end

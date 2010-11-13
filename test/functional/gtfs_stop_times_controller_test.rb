require 'test_helper'

class GtfsStopTimesControllerTest < ActionController::TestCase
  setup do
    @gtfs_stop_time = gtfs_stop_times(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtfs_stop_times)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtfs_stop_time" do
    assert_difference('GtfsStopTime.count') do
      post :create, :gtfs_stop_time => @gtfs_stop_time.attributes
    end

    assert_redirected_to gtfs_stop_time_path(assigns(:gtfs_stop_time))
  end

  test "should show gtfs_stop_time" do
    get :show, :id => @gtfs_stop_time.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @gtfs_stop_time.to_param
    assert_response :success
  end

  test "should update gtfs_stop_time" do
    put :update, :id => @gtfs_stop_time.to_param, :gtfs_stop_time => @gtfs_stop_time.attributes
    assert_redirected_to gtfs_stop_time_path(assigns(:gtfs_stop_time))
  end

  test "should destroy gtfs_stop_time" do
    assert_difference('GtfsStopTime.count', -1) do
      delete :destroy, :id => @gtfs_stop_time.to_param
    end

    assert_redirected_to gtfs_stop_times_path
  end
end

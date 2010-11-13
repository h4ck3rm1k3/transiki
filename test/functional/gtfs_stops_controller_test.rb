require 'test_helper'

class GtfsStopsControllerTest < ActionController::TestCase
  setup do
    @gtfs_stop = gtfs_stops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtfs_stops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtfs_stop" do
    assert_difference('GtfsStop.count') do
      post :create, :gtfs_stop => @gtfs_stop.attributes
    end

    assert_redirected_to gtfs_stop_path(assigns(:gtfs_stop))
  end

  test "should show gtfs_stop" do
    get :show, :id => @gtfs_stop.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @gtfs_stop.to_param
    assert_response :success
  end

  test "should update gtfs_stop" do
    put :update, :id => @gtfs_stop.to_param, :gtfs_stop => @gtfs_stop.attributes
    assert_redirected_to gtfs_stop_path(assigns(:gtfs_stop))
  end

  test "should destroy gtfs_stop" do
    assert_difference('GtfsStop.count', -1) do
      delete :destroy, :id => @gtfs_stop.to_param
    end

    assert_redirected_to gtfs_stops_path
  end
end

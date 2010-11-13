require 'test_helper'

class GtfsTripsControllerTest < ActionController::TestCase
  setup do
    @gtfs_trip = gtfs_trips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtfs_trips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtfs_trip" do
    assert_difference('GtfsTrip.count') do
      post :create, :gtfs_trip => @gtfs_trip.attributes
    end

    assert_redirected_to gtfs_trip_path(assigns(:gtfs_trip))
  end

  test "should show gtfs_trip" do
    get :show, :id => @gtfs_trip.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @gtfs_trip.to_param
    assert_response :success
  end

  test "should update gtfs_trip" do
    put :update, :id => @gtfs_trip.to_param, :gtfs_trip => @gtfs_trip.attributes
    assert_redirected_to gtfs_trip_path(assigns(:gtfs_trip))
  end

  test "should destroy gtfs_trip" do
    assert_difference('GtfsTrip.count', -1) do
      delete :destroy, :id => @gtfs_trip.to_param
    end

    assert_redirected_to gtfs_trips_path
  end
end

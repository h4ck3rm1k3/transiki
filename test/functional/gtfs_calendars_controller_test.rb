require 'test_helper'

class GtfsCalendarsControllerTest < ActionController::TestCase
  setup do
    @gtfs_calendar = gtfs_calendars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtfs_calendars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtfs_calendar" do
    assert_difference('GtfsCalendar.count') do
      post :create, :gtfs_calendar => @gtfs_calendar.attributes
    end

    assert_redirected_to gtfs_calendar_path(assigns(:gtfs_calendar))
  end

  test "should show gtfs_calendar" do
    get :show, :id => @gtfs_calendar.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @gtfs_calendar.to_param
    assert_response :success
  end

  test "should update gtfs_calendar" do
    put :update, :id => @gtfs_calendar.to_param, :gtfs_calendar => @gtfs_calendar.attributes
    assert_redirected_to gtfs_calendar_path(assigns(:gtfs_calendar))
  end

  test "should destroy gtfs_calendar" do
    assert_difference('GtfsCalendar.count', -1) do
      delete :destroy, :id => @gtfs_calendar.to_param
    end

    assert_redirected_to gtfs_calendars_path
  end
end

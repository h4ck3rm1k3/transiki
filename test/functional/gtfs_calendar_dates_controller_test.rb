require 'test_helper'

class GtfsCalendarDatesControllerTest < ActionController::TestCase
  setup do
    @gtfs_calendar_date = gtfs_calendar_dates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtfs_calendar_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtfs_calendar_date" do
    assert_difference('GtfsCalendarDate.count') do
      post :create, :gtfs_calendar_date => @gtfs_calendar_date.attributes
    end

    assert_redirected_to gtfs_calendar_date_path(assigns(:gtfs_calendar_date))
  end

  test "should show gtfs_calendar_date" do
    get :show, :id => @gtfs_calendar_date.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @gtfs_calendar_date.to_param
    assert_response :success
  end

  test "should update gtfs_calendar_date" do
    put :update, :id => @gtfs_calendar_date.to_param, :gtfs_calendar_date => @gtfs_calendar_date.attributes
    assert_redirected_to gtfs_calendar_date_path(assigns(:gtfs_calendar_date))
  end

  test "should destroy gtfs_calendar_date" do
    assert_difference('GtfsCalendarDate.count', -1) do
      delete :destroy, :id => @gtfs_calendar_date.to_param
    end

    assert_redirected_to gtfs_calendar_dates_path
  end
end

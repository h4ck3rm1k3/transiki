require 'test_helper'

class GtfsAgenciesControllerTest < ActionController::TestCase
  setup do
    @gtfs_agency = gtfs_agencies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtfs_agencies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtfs_agency" do
    assert_difference('GtfsAgency.count') do
      post :create, :gtfs_agency => @gtfs_agency.attributes
    end

    assert_redirected_to gtfs_agency_path(assigns(:gtfs_agency))
  end

  test "should show gtfs_agency" do
    get :show, :id => @gtfs_agency.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @gtfs_agency.to_param
    assert_response :success
  end

  test "should update gtfs_agency" do
    put :update, :id => @gtfs_agency.to_param, :gtfs_agency => @gtfs_agency.attributes
    assert_redirected_to gtfs_agency_path(assigns(:gtfs_agency))
  end

  test "should destroy gtfs_agency" do
    assert_difference('GtfsAgency.count', -1) do
      delete :destroy, :id => @gtfs_agency.to_param
    end

    assert_redirected_to gtfs_agencies_path
  end
end

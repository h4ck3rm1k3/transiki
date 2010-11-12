require 'test_helper'

class GtfsRoutesControllerTest < ActionController::TestCase
  setup do
    @gtfs_route = gtfs_routes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtfs_routes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtfs_route" do
    assert_difference('GtfsRoute.count') do
      post :create, :gtfs_route => @gtfs_route.attributes
    end

    assert_redirected_to gtfs_route_path(assigns(:gtfs_route))
  end

  test "should show gtfs_route" do
    get :show, :id => @gtfs_route.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @gtfs_route.to_param
    assert_response :success
  end

  test "should update gtfs_route" do
    put :update, :id => @gtfs_route.to_param, :gtfs_route => @gtfs_route.attributes
    assert_redirected_to gtfs_route_path(assigns(:gtfs_route))
  end

  test "should destroy gtfs_route" do
    assert_difference('GtfsRoute.count', -1) do
      delete :destroy, :id => @gtfs_route.to_param
    end

    assert_redirected_to gtfs_routes_path
  end
end

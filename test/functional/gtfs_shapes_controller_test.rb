require 'test_helper'

class GtfsShapesControllerTest < ActionController::TestCase
  setup do
    @gtfs_shape = gtfs_shapes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtfs_shapes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtfs_shape" do
    assert_difference('GtfsShape.count') do
      post :create, :gtfs_shape => @gtfs_shape.attributes
    end

    assert_redirected_to gtfs_shape_path(assigns(:gtfs_shape))
  end

  test "should show gtfs_shape" do
    get :show, :id => @gtfs_shape.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @gtfs_shape.to_param
    assert_response :success
  end

  test "should update gtfs_shape" do
    put :update, :id => @gtfs_shape.to_param, :gtfs_shape => @gtfs_shape.attributes
    assert_redirected_to gtfs_shape_path(assigns(:gtfs_shape))
  end

  test "should destroy gtfs_shape" do
    assert_difference('GtfsShape.count', -1) do
      delete :destroy, :id => @gtfs_shape.to_param
    end

    assert_redirected_to gtfs_shapes_path
  end
end

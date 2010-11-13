require 'test_helper'

class GtfsFareAttributesControllerTest < ActionController::TestCase
  setup do
    @gtfs_fare_attribute = gtfs_fare_attributes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtfs_fare_attributes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtfs_fare_attribute" do
    assert_difference('GtfsFareAttribute.count') do
      post :create, :gtfs_fare_attribute => @gtfs_fare_attribute.attributes
    end

    assert_redirected_to gtfs_fare_attribute_path(assigns(:gtfs_fare_attribute))
  end

  test "should show gtfs_fare_attribute" do
    get :show, :id => @gtfs_fare_attribute.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @gtfs_fare_attribute.to_param
    assert_response :success
  end

  test "should update gtfs_fare_attribute" do
    put :update, :id => @gtfs_fare_attribute.to_param, :gtfs_fare_attribute => @gtfs_fare_attribute.attributes
    assert_redirected_to gtfs_fare_attribute_path(assigns(:gtfs_fare_attribute))
  end

  test "should destroy gtfs_fare_attribute" do
    assert_difference('GtfsFareAttribute.count', -1) do
      delete :destroy, :id => @gtfs_fare_attribute.to_param
    end

    assert_redirected_to gtfs_fare_attributes_path
  end
end

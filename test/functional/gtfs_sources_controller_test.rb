require 'test_helper'

class GtfsSourcesControllerTest < ActionController::TestCase
  setup do
    @gtfs_source = gtfs_sources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtfs_sources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtfs_source" do
    assert_difference('GtfsSource.count') do
      post :create, :gtfs_source => @gtfs_source.attributes
    end

    assert_redirected_to gtfs_source_path(assigns(:gtfs_source))
  end

  test "should show gtfs_source" do
    get :show, :id => @gtfs_source.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @gtfs_source.to_param
    assert_response :success
  end

  test "should update gtfs_source" do
    put :update, :id => @gtfs_source.to_param, :gtfs_source => @gtfs_source.attributes
    assert_redirected_to gtfs_source_path(assigns(:gtfs_source))
  end

  test "should destroy gtfs_source" do
    assert_difference('GtfsSource.count', -1) do
      delete :destroy, :id => @gtfs_source.to_param
    end

    assert_redirected_to gtfs_sources_path
  end
end

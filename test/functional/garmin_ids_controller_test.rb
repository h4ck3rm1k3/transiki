require 'test_helper'

class GarminIdsControllerTest < ActionController::TestCase
  setup do
    @garmin_id = garmin_ids(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:garmin_ids)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create garmin_id" do
    assert_difference('GarminId.count') do
      post :create, :garmin_id => @garmin_id.attributes
    end

    assert_redirected_to garmin_id_path(assigns(:garmin_id))
  end

  test "should show garmin_id" do
    get :show, :id => @garmin_id.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @garmin_id.to_param
    assert_response :success
  end

  test "should update garmin_id" do
    put :update, :id => @garmin_id.to_param, :garmin_id => @garmin_id.attributes
    assert_redirected_to garmin_id_path(assigns(:garmin_id))
  end

  test "should destroy garmin_id" do
    assert_difference('GarminId.count', -1) do
      delete :destroy, :id => @garmin_id.to_param
    end

    assert_redirected_to garmin_ids_path
  end
end

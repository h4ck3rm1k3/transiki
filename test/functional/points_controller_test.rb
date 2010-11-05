require 'test_helper'

class PointsControllerTest < ActionController::TestCase
  setup do
    @point = points(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:points)
  end

  test "should get new" do
    session[:user_id] = 1# hack
    get :new
#    p @response
    assert_response :success
  end

  test "should create point" do
    session[:user_id] = 1# hack
    assert_difference('Point.count') do
      post :create, :point => @point.attributes
    end
#    p @response
    assert_redirected_to point_path(assigns(:point))
  end

  test "should show point" do
    get :show, :id => @point.to_param
    assert_response :success
  end

  test "should get edit" do
    session[:user_id] = 1# hack
    get :edit, :id => @point.to_param

    assert_response :success
  end

  test "should update point" do
    put :update, :id => @point.to_param, :point => @point.attributes
    assert_redirected_to point_path(assigns(:point))
  end

  test "should destroy point" do
    assert_difference('Point.count', -1) do
      delete :destroy, :id => @point.to_param
    end

    assert_redirected_to points_path
  end
end

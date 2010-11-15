require 'test_helper'

class MediawikiusersControllerTest < ActionController::TestCase
  setup do
    @mediawikiuser = mediawikiusers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mediawikiusers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mediawikiuser" do
    assert_difference('Mediawikiuser.count') do
      post :create, :mediawikiuser => @mediawikiuser.attributes
    end

    assert_redirected_to mediawikiuser_path(assigns(:mediawikiuser))
  end

  test "should show mediawikiuser" do
    get :show, :id => @mediawikiuser.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mediawikiuser.to_param
    assert_response :success
  end

  test "should update mediawikiuser" do
    put :update, :id => @mediawikiuser.to_param, :mediawikiuser => @mediawikiuser.attributes
    assert_redirected_to mediawikiuser_path(assigns(:mediawikiuser))
  end

  test "should destroy mediawikiuser" do
    assert_difference('Mediawikiuser.count', -1) do
      delete :destroy, :id => @mediawikiuser.to_param
    end

    assert_redirected_to mediawikiusers_path
  end
end

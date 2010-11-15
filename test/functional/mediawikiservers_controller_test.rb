require 'test_helper'

class MediawikiserversControllerTest < ActionController::TestCase
  setup do
    @mediawikiserver = mediawikiservers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mediawikiservers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mediawikiserver" do
    assert_difference('Mediawikiserver.count') do
      post :create, :mediawikiserver => @mediawikiserver.attributes
    end

    assert_redirected_to mediawikiserver_path(assigns(:mediawikiserver))
  end

  test "should show mediawikiserver" do
    get :show, :id => @mediawikiserver.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mediawikiserver.to_param
    assert_response :success
  end

  test "should update mediawikiserver" do
    put :update, :id => @mediawikiserver.to_param, :mediawikiserver => @mediawikiserver.attributes
    assert_redirected_to mediawikiserver_path(assigns(:mediawikiserver))
  end

  test "should destroy mediawikiserver" do
    assert_difference('Mediawikiserver.count', -1) do
      delete :destroy, :id => @mediawikiserver.to_param
    end

    assert_redirected_to mediawikiservers_path
  end
end

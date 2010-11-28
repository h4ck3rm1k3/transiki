require 'test_helper'

class MediawikicategoriesControllerTest < ActionController::TestCase
  setup do
    @mediawikicategory = mediawikicategories(:one)
  end

  test "shouldimporttest" do
    get :importimagefiles, "mediawikicategory_id"=> @mediawikicategory.to_param
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mediawikicategories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mediawikicategory" do
    assert_difference('Mediawikicategory.count') do
      post :create, :mediawikicategory => @mediawikicategory.attributes
    end

    assert_redirected_to mediawikicategory_path(assigns(:mediawikicategory))
  end

  test "should show mediawikicategory" do
    get :show, :id => @mediawikicategory.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mediawikicategory.to_param
    assert_response :success
  end

  test "should update mediawikicategory" do
    put :update, :id => @mediawikicategory.to_param, :mediawikicategory => @mediawikicategory.attributes
    assert_redirected_to mediawikicategory_path(assigns(:mediawikicategory))
  end

  test "should destroy mediawikicategory" do
    assert_difference('Mediawikicategory.count', -1) do
      delete :destroy, :id => @mediawikicategory.to_param
    end

    assert_redirected_to mediawikicategories_path
  end

end

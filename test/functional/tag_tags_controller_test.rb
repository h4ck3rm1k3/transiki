require 'test_helper'

class TagTagsControllerTest < ActionController::TestCase
  setup do
    @tag_tag = tag_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tag_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tag_tag" do
    assert_difference('TagTag.count') do
      post :create, :tag_tag => @tag_tag.attributes
    end

    assert_redirected_to tag_tag_path(assigns(:tag_tag))
  end

  test "should show tag_tag" do
    get :show, :id => @tag_tag.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tag_tag.to_param
    assert_response :success
  end

  test "should update tag_tag" do
    put :update, :id => @tag_tag.to_param, :tag_tag => @tag_tag.attributes
    assert_redirected_to tag_tag_path(assigns(:tag_tag))
  end

  test "should destroy tag_tag" do
    assert_difference('TagTag.count', -1) do
      delete :destroy, :id => @tag_tag.to_param
    end

    assert_redirected_to tag_tags_path
  end
end

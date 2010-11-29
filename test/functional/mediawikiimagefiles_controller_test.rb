require 'test_helper'

class MediawikiimagefilesControllerTest < ActionController::TestCase
  setup do
    @mediawikiimagefile = mediawikiimagefiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mediawikiimagefiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mediawikiimagefile" do
    assert_difference('Mediawikiimagefile.count') do
      post :create, :mediawikiimagefile => @mediawikiimagefile.attributes
    end

    assert_redirected_to mediawikiimagefile_path(assigns(:mediawikiimagefile))
  end

  test "should show mediawikiimagefile" do
    get :show, :id => @mediawikiimagefile.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mediawikiimagefile.to_param
    assert_response :success
  end

  test "should update mediawikiimagefile" do
    put :update, :id => @mediawikiimagefile.to_param, :mediawikiimagefile => @mediawikiimagefile.attributes
    assert_redirected_to mediawikiimagefile_path(assigns(:mediawikiimagefile))
  end

  test "should destroy mediawikiimagefile" do
    assert_difference('Mediawikiimagefile.count', -1) do
      delete :destroy, :id => @mediawikiimagefile.to_param
    end

    assert_redirected_to mediawikiimagefiles_path
  end

  #categories_controller_test.rb
  test "should update mediawikiimagefile geotag " do
    assert_difference('Mediawikiimagefile.count') do
      post :create, :mediawikiimagefile => @mediawikiimagefile.attributes
    end
    assert_redirected_to mediawikiimagefile_path(assigns(:mediawikiimagefile))

    get :show, :id => @mediawikiimagefile.to_param
    p @mediawikiimagefile

    get :geotag, :mediawikiimagefile_id => @mediawikiimagefile.to_param
    p @point

    newpoint = {}
    newpoint["latitude"]=123
    newpoint["longitude"]=345
    p "going to post "
    p "as param"
    pp @mediawikiimagefile.to_param
    p "as data"
    pp @mediawikiimagefile
    p "next is post"
    post :geotag, :point => newpoint, :mediawikiimagefile_id => @mediawikiimagefile.to_param
    p @point

    newpoint["latitude"]=987
    newpoint["longitude"]=654
    p "next is post a new point"
    post :geotag, :point => newpoint, :mediawikiimagefile_id => @mediawikiimagefile.to_param
    p @point

  end

end

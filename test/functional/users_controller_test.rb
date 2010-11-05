require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  fixtures :users

  setup do
    @user = users(:normal_user)
#User.first
      
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

Factory.define :user do |user| user.salt "pepper" end

  test "should create user" do
    assert_difference('User.count') do

      @newuser = User.new(       :id => 123,
                                :email => "testnew@openstreetmap.org",
                                :hashed_password =>"12334556",
#                                :confimed => true,
                                :created_at => "2007-01-01 00:00:00",
                                :updated_at => "2007-01-01 00:00:00")

      post :create, :user => @newuser.attributes
    end
#    print user_path(assigns(:user)) /users/3/users

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, :id => @user.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @user.to_param
    assert_response :success
  end

  test "should update user" do
    put :update, :id => @user.to_param, :user => @user.attributes
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, :id => @user.to_param
    end

    assert_redirected_to users_path
  end
end

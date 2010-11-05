require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get(:create, {'email' => "test@openstreetmap.org", 'password' => "test"}) 
    assert_response 302 #:success, redirect to main page
  end

  test "should get destroy" do
    #session DELETE /sessions/:id(.:format)          {:controller=>"sessions", :action=>"destroy"}
    #ActionController::RoutingError: No route matches {:action=>"destroy", :controller=>"sessions"}

    #DELETE /sessions/:id(.:format) 
    get :destroy
    assert_response 302 # redirect
  end

end

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
    #thanks to RurouniJones and aknagi from #ror on irc.freenode.net
    get(:destroy, {:controller=>"sessions", :action=>"destroy", :id => 1})
    assert_response 302 # redirect
  end

end

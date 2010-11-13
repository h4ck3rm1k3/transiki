require 'test_helper'

class SimpleSchedulesControllerTest < ActionController::TestCase
  setup do
    @simple_schedule = simple_schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simple_schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simple_schedule" do
    assert_difference('SimpleSchedule.count') do
      post :create, :simple_schedule => @simple_schedule.attributes
    end

    assert_redirected_to simple_schedule_path(assigns(:simple_schedule))
  end

  test "should show simple_schedule" do
    get :show, :id => @simple_schedule.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @simple_schedule.to_param
    assert_response :success
  end

  test "should update simple_schedule" do
    put :update, :id => @simple_schedule.to_param, :simple_schedule => @simple_schedule.attributes
    assert_redirected_to simple_schedule_path(assigns(:simple_schedule))
  end

  test "should destroy simple_schedule" do
    assert_difference('SimpleSchedule.count', -1) do
      delete :destroy, :id => @simple_schedule.to_param
    end

    assert_redirected_to simple_schedules_path
  end
end

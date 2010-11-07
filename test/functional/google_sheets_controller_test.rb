require 'test_helper'

class GoogleSheetsControllerTest < ActionController::TestCase
  setup do
    @google_sheet = google_sheets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:google_sheets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create google_sheet" do
    assert_difference('GoogleSheet.count') do
      post :create, :google_sheet => @google_sheet.attributes
    end

    assert_redirected_to google_sheet_path(assigns(:google_sheet))
  end

  test "should show google_sheet" do
    get :show, :id => @google_sheet.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @google_sheet.to_param
    assert_response :success
  end

  test "should update google_sheet" do
    put :update, :id => @google_sheet.to_param, :google_sheet => @google_sheet.attributes
    assert_redirected_to google_sheet_path(assigns(:google_sheet))
  end

  test "should destroy google_sheet" do
    assert_difference('GoogleSheet.count', -1) do
      delete :destroy, :id => @google_sheet.to_param
    end

    assert_redirected_to google_sheets_path
  end
end

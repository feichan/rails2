require 'test_helper'

class CollegesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:colleges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create college" do
    assert_difference('College.count') do
      post :create, :college => { }
    end

    assert_redirected_to college_path(assigns(:college))
  end

  test "should show college" do
    get :show, :id => colleges(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => colleges(:one).to_param
    assert_response :success
  end

  test "should update college" do
    put :update, :id => colleges(:one).to_param, :college => { }
    assert_redirected_to college_path(assigns(:college))
  end

  test "should destroy college" do
    assert_difference('College.count', -1) do
      delete :destroy, :id => colleges(:one).to_param
    end

    assert_redirected_to colleges_path
  end
end

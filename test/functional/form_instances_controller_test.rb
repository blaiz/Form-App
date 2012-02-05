require 'test_helper'

class FormInstancesControllerTest < ActionController::TestCase
  setup do
    @form_instance = form_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:form_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create form_instance" do
    assert_difference('FormInstance.count') do
      post :create, :form_instance => @form_instance.attributes
    end

    assert_redirected_to form_instance_path(assigns(:form_instance))
  end

  test "should show form_instance" do
    get :show, :id => @form_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @form_instance
    assert_response :success
  end

  test "should update form_instance" do
    put :update, :id => @form_instance, :form_instance => @form_instance.attributes
    assert_redirected_to form_instance_path(assigns(:form_instance))
  end

  test "should destroy form_instance" do
    assert_difference('FormInstance.count', -1) do
      delete :destroy, :id => @form_instance
    end

    assert_redirected_to form_instances_path
  end
end

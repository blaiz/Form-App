require 'test_helper'

class FormFieldsControllerTest < ActionController::TestCase
  setup do
    @form_field = form_fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:form_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create form_field" do
    assert_difference('FormField.count') do
      post :create, :form_field => @form_field.attributes
    end

    assert_redirected_to form_field_path(assigns(:form_field))
  end

  test "should show form_field" do
    get :show, :id => @form_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @form_field
    assert_response :success
  end

  test "should update form_field" do
    put :update, :id => @form_field, :form_field => @form_field.attributes
    assert_redirected_to form_field_path(assigns(:form_field))
  end

  test "should destroy form_field" do
    assert_difference('FormField.count', -1) do
      delete :destroy, :id => @form_field
    end

    assert_redirected_to form_fields_path
  end
end

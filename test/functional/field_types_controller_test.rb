require 'test_helper'

class FieldTypesControllerTest < ActionController::TestCase
  setup do
    @field_type = field_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:field_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create field_type" do
    assert_difference('FieldType.count') do
      post :create, :field_type => @field_type.attributes
    end

    assert_redirected_to field_type_path(assigns(:field_type))
  end

  test "should show field_type" do
    get :show, :id => @field_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @field_type
    assert_response :success
  end

  test "should update field_type" do
    put :update, :id => @field_type, :field_type => @field_type.attributes
    assert_redirected_to field_type_path(assigns(:field_type))
  end

  test "should destroy field_type" do
    assert_difference('FieldType.count', -1) do
      delete :destroy, :id => @field_type
    end

    assert_redirected_to field_types_path
  end
end

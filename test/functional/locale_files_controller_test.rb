# -*- encoding : utf-8 -*-
require 'test_helper'

class LocaleFilesControllerTest < ActionController::TestCase
  setup do
    @locale_file = locale_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locale_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create locale_file" do
    assert_difference('LocaleFile.count') do
      post :create, :locale_file => @locale_file.attributes
    end

    assert_redirected_to locale_file_path(assigns(:locale_file))
  end

  test "should show locale_file" do
    get :show, :id => @locale_file.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @locale_file.to_param
    assert_response :success
  end

  test "should update locale_file" do
    put :update, :id => @locale_file.to_param, :locale_file => @locale_file.attributes
    assert_redirected_to locale_file_path(assigns(:locale_file))
  end

  test "should destroy locale_file" do
    assert_difference('LocaleFile.count', -1) do
      delete :destroy, :id => @locale_file.to_param
    end

    assert_redirected_to locale_files_path
  end
end

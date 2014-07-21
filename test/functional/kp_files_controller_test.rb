require 'test_helper'

class KpFilesControllerTest < ActionController::TestCase
  setup do
    @kp_file = kp_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kp_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kp_file" do
    assert_difference('KpFile.count') do
      post :create, kp_file: { create_time: @kp_file.create_time, file_id: @kp_file.file_id, is_delete: @kp_file.is_delete, modify_time: @kp_file.modify_time, name: @kp_file.name, rev: @kp_file.rev, sha1: @kp_file.sha1, share_id: @kp_file.share_id, size: @kp_file.size, type: @kp_file.type }
    end

    assert_redirected_to kp_file_path(assigns(:kp_file))
  end

  test "should show kp_file" do
    get :show, id: @kp_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kp_file
    assert_response :success
  end

  test "should update kp_file" do
    put :update, id: @kp_file, kp_file: { create_time: @kp_file.create_time, file_id: @kp_file.file_id, is_delete: @kp_file.is_delete, modify_time: @kp_file.modify_time, name: @kp_file.name, rev: @kp_file.rev, sha1: @kp_file.sha1, share_id: @kp_file.share_id, size: @kp_file.size, type: @kp_file.type }
    assert_redirected_to kp_file_path(assigns(:kp_file))
  end

  test "should destroy kp_file" do
    assert_difference('KpFile.count', -1) do
      delete :destroy, id: @kp_file
    end

    assert_redirected_to kp_files_path
  end
end

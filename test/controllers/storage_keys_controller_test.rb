require "test_helper"

class StorageKeysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @storage_key = storage_keys(:one)
  end

  test "should get index" do
    get storage_keys_url
    assert_response :success
  end

  test "should get new" do
    get new_storage_key_url
    assert_response :success
  end

  test "should create storage_key" do
    assert_difference('StorageKey.count') do
      post storage_keys_url, params: { storage_key: { storage_key_id: @storage_key.storage_key_id, user_id: @storage_key.user_id } }
    end

    assert_redirected_to storage_key_url(StorageKey.last)
  end

  test "should show storage_key" do
    get storage_key_url(@storage_key)
    assert_response :success
  end

  test "should get edit" do
    get edit_storage_key_url(@storage_key)
    assert_response :success
  end

  test "should update storage_key" do
    patch storage_key_url(@storage_key), params: { storage_key: { storage_key_id: @storage_key.storage_key_id, user_id: @storage_key.user_id } }
    assert_redirected_to storage_key_url(@storage_key)
  end

  test "should destroy storage_key" do
    assert_difference('StorageKey.count', -1) do
      delete storage_key_url(@storage_key)
    end

    assert_redirected_to storage_keys_url
  end
end

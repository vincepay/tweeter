require 'test_helper'

class BiosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bios_index_url
    assert_response :success
  end

  test "should get show" do
    get bios_show_url
    assert_response :success
  end

  test "should get new" do
    get bios_new_url
    assert_response :success
  end

  test "should get edit" do
    get bios_edit_url
    assert_response :success
  end

end

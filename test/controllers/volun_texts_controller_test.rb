require 'test_helper'

class VolunTextsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @volun_text = volun_texts(:one)
  end

  test "should get index" do
    get volun_texts_url
    assert_response :success
  end

  test "should get new" do
    get new_volun_text_url
    assert_response :success
  end

  test "should create volun_text" do
    assert_difference('VolunText.count') do
      post volun_texts_url, params: { volun_text: { body: @volun_text.body, slug: @volun_text.slug, title: @volun_text.title } }
    end

    assert_redirected_to volun_text_url(VolunText.last)
  end

  test "should show volun_text" do
    get volun_text_url(@volun_text)
    assert_response :success
  end

  test "should get edit" do
    get edit_volun_text_url(@volun_text)
    assert_response :success
  end

  test "should update volun_text" do
    patch volun_text_url(@volun_text), params: { volun_text: { body: @volun_text.body, slug: @volun_text.slug, title: @volun_text.title } }
    assert_redirected_to volun_text_url(@volun_text)
  end

  test "should destroy volun_text" do
    assert_difference('VolunText.count', -1) do
      delete volun_text_url(@volun_text)
    end

    assert_redirected_to volun_texts_url
  end
end

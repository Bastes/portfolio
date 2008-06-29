require 'test_helper'

class PicturesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:pictures)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_picture
    assert_difference('Picture.count') do
      post :create, :picture => { }
    end

    assert_redirected_to picture_path(assigns(:picture))
  end

  def test_should_show_picture
    get :show, :id => pictures(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => pictures(:one).id
    assert_response :success
  end

  def test_should_update_picture
    put :update, :id => pictures(:one).id, :picture => { }
    assert_redirected_to picture_path(assigns(:picture))
  end

  def test_should_destroy_picture
    assert_difference('Picture.count', -1) do
      delete :destroy, :id => pictures(:one).id
    end

    assert_redirected_to pictures_path
  end
end

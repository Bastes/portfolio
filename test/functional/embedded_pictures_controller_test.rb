require 'test_helper'

class EmbeddedPicturesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:embedded_pictures)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_embedded_pictures
    assert_difference('EmbeddedPictures.count') do
      post :create, :embedded_pictures => { }
    end

    assert_redirected_to embedded_pictures_path(assigns(:embedded_pictures))
  end

  def test_should_show_embedded_pictures
    get :show, :id => embedded_pictures(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => embedded_pictures(:one).id
    assert_response :success
  end

  def test_should_update_embedded_pictures
    put :update, :id => embedded_pictures(:one).id, :embedded_pictures => { }
    assert_redirected_to embedded_pictures_path(assigns(:embedded_pictures))
  end

  def test_should_destroy_embedded_pictures
    assert_difference('EmbeddedPictures.count', -1) do
      delete :destroy, :id => embedded_pictures(:one).id
    end

    assert_redirected_to embedded_pictures_path
  end
end

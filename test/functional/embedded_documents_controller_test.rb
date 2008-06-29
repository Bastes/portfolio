require 'test_helper'

class EmbeddedDocumentsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:embedded_documents)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_embedded_documents
    assert_difference('EmbeddedDocuments.count') do
      post :create, :embedded_documents => { }
    end

    assert_redirected_to embedded_documents_path(assigns(:embedded_documents))
  end

  def test_should_show_embedded_documents
    get :show, :id => embedded_documents(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => embedded_documents(:one).id
    assert_response :success
  end

  def test_should_update_embedded_documents
    put :update, :id => embedded_documents(:one).id, :embedded_documents => { }
    assert_redirected_to embedded_documents_path(assigns(:embedded_documents))
  end

  def test_should_destroy_embedded_documents
    assert_difference('EmbeddedDocuments.count', -1) do
      delete :destroy, :id => embedded_documents(:one).id
    end

    assert_redirected_to embedded_documents_path
  end
end

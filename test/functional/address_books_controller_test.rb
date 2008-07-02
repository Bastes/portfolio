require 'test_helper'

class AddressBooksControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:address_books)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_address_book
    assert_difference('AddressBook.count') do
      post :create, :address_book => { }
    end

    assert_redirected_to address_book_path(assigns(:address_book))
  end

  def test_should_show_address_book
    get :show, :id => address_books(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => address_books(:one).id
    assert_response :success
  end

  def test_should_update_address_book
    put :update, :id => address_books(:one).id, :address_book => { }
    assert_redirected_to address_book_path(assigns(:address_book))
  end

  def test_should_destroy_address_book
    assert_difference('AddressBook.count', -1) do
      delete :destroy, :id => address_books(:one).id
    end

    assert_redirected_to address_books_path
  end
end

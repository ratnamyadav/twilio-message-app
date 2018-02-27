require 'test_helper'

class TwilioBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @twilio_book = twilio_books(:one)
  end

  test "should get index" do
    get twilio_books_url
    assert_response :success
  end

  test "should get new" do
    get new_twilio_book_url
    assert_response :success
  end

  test "should create twilio_book" do
    assert_difference('TwilioBook.count') do
      post twilio_books_url, params: { twilio_book: { message_description: @twilio_book.message_description, message_name: @twilio_book.message_name } }
    end

    assert_redirected_to twilio_book_url(TwilioBook.last)
  end

  test "should show twilio_book" do
    get twilio_book_url(@twilio_book)
    assert_response :success
  end

  test "should get edit" do
    get edit_twilio_book_url(@twilio_book)
    assert_response :success
  end

  test "should update twilio_book" do
    patch twilio_book_url(@twilio_book), params: { twilio_book: { message_description: @twilio_book.message_description, message_name: @twilio_book.message_name } }
    assert_redirected_to twilio_book_url(@twilio_book)
  end

  test "should destroy twilio_book" do
    assert_difference('TwilioBook.count', -1) do
      delete twilio_book_url(@twilio_book)
    end

    assert_redirected_to twilio_books_url
  end
end

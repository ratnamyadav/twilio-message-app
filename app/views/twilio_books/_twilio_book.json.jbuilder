json.extract! twilio_book, :id, :message_name, :message_description, :created_at, :updated_at
json.url twilio_book_url(twilio_book, format: :json)

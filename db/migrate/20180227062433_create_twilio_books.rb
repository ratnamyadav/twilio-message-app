class CreateTwilioBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :twilio_books do |t|
      t.string :message_name
      t.text :message_description

      t.timestamps
    end
  end
end

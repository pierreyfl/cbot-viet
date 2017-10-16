class CreateChat < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.text :message
      t.string :sender_id
      t.datetime :sent_at
    end
  end
end

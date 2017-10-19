class CreatePostbacks < ActiveRecord::Migration
  def change
    create_table :postbacks do |t|
      t.string :payload
      t.text :reply

      t.timestamps null: false
    end
  end
end

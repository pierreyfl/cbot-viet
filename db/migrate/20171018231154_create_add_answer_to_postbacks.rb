class CreateAddAnswerToPostbacks < ActiveRecord::Migration
  def change
    create_table :add_answer_to_postbacks do |t|
      t.references :answer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

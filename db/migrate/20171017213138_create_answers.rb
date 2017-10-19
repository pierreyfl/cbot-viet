class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :question, array: true, default: []
      t.text :reply

      t.timestamps null: false
    end
  end
end

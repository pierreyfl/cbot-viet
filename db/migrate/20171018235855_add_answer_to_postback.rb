class AddAnswerToPostback < ActiveRecord::Migration
  def change
    add_reference :postbacks, :answer, index: true, foreign_key: true
  end
end

class AddBasicbotToAnswers < ActiveRecord::Migration
  def change
    add_reference :answers, :basicbot, index: true, foreign_key: true
  end
end

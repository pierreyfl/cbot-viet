class AddMultipleAnswersToPostback < ActiveRecord::Migration
  def change
    add_column :postbacks, :multiple_answers, :boolean
    add_column :postbacks, :multiple_options, :text, array: true, default: []
  end
end

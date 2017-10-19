class AddMultipleAnswersToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :multiple_answers, :boolean
    add_column :answers, :multiple_options, :text, array: true, default: []
  end
end

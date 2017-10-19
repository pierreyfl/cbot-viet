class AddExactKeywordToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :exact_keyword, :boolean
  end
end

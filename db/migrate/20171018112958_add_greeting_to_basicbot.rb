class AddGreetingToBasicbot < ActiveRecord::Migration
  def change
    add_column :basicbots, :greeting, :text
  end
end

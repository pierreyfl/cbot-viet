class AddWelcomeGreetingToBasicbot < ActiveRecord::Migration
  def change
    add_column :basicbots, :welcome_greeting, :string
  end
end

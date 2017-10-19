class AddGetStartedToBasicbot < ActiveRecord::Migration
  def change
    add_column :basicbots, :get_started, :boolean
  end
end

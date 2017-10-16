class AddMessageTextToBasicbot < ActiveRecord::Migration
  def change
    add_column :basicbots, :message_text, :string
  end
end

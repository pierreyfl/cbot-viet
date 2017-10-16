class AddPageIdToBasicbot < ActiveRecord::Migration
  def change
    add_column :basicbots, :page_id, :string
  end
end

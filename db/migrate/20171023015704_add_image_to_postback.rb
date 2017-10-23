class AddImageToPostback < ActiveRecord::Migration
  def change
    add_column :postbacks, :image, :string
  end
end

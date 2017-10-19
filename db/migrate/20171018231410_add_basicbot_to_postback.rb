class AddBasicbotToPostback < ActiveRecord::Migration
  def change
    add_reference :postbacks, :basicbot, index: true, foreign_key: true
  end
end

class CreateBasicbot < ActiveRecord::Migration
  def change
    create_table :basicbots do |t|
      t.string :name
      t.string :access_token
      t.string :verify_token
      t.string :app_secret
    end
  end
end

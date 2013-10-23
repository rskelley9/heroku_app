class CreateTwitterUsers < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.string :handle
      t.string :user_name
      t.timestamps
    end
  end
end

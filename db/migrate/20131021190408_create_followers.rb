class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.string :handle
      t.integer :twitter_user_id
      t.timestamps
    end
  end
end

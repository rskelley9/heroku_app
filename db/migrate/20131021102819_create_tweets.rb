class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :twitter_user_id
      t.integer :follower_id
      t.string :text
      t.timestamp :tweet_time
      t.timestamps
    end
  end
end

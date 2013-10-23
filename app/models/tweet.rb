class Tweet < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :twitter_user
  belongs_to :follower
end

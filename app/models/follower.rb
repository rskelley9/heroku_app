class Follower < ActiveRecord::Base
  belongs_to :twitter_user
  has_many :tweets

end

class TwitterUser < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets
  has_many :followers


  def self.generate(handle)
    user ||= TwitterUser.create(handle: handle, user_name: TwitterUser.my_name(handle))
    user.fetch_tweets
    user
  end

  def self.get(handle)
    Twitter.user(handle).handle
  end

  def self.my_name(handle)
    Twitter.user(handle).name
  end

  def fetch_tweet
    tweet = Twitter.user_timeline(self.handle, count:1)
    Tweet.create(twitter_user_id: self.id, text: tweet.text, tweet_time: tweet.created_at)
  end

  def fetch_tweets
    tweets = Twitter.user_timeline(self.handle, count: 10)
    tweets.each do |tweet|
      Tweet.create(twitter_user_id: self.id, text: tweet.text, tweet_time: tweet.created_at)
    end
  end

  def fetch_followers
    @followers = Twitter.friends.all

    @followers.each do |follower|
      Follower.create(handle: follower.handle, twitter_user_id: self.id)
    end
  end

  def tweet(text)
    Twitter.update(text)
  end

end

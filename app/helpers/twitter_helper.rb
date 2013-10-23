helpers do

  def tweets_stale?(last_updated)
    current_time = Time.now
    time_elapsed = current_time - last_updated

    if time_elapsed > 60*15
      return true
    else
      return false
    end
  end

  def better_stale?(user)
    last_update = Time.now - user.updated_at
    last_tweet = @user.tweets[-1].tweet_time
    second_tweet = @user.tweets[-2].tweet_time
    elapsed_time = last_tweet - second_tweet
    if last_update > elapsed_time
      return true
    else
      return false
    end
  end

end

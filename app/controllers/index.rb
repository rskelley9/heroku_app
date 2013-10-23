get '/' do
  erb :index
end

get '/:handle' do
  @user = TwitterUser.generate(params[:handle])
  session[:user_id] = @user.id
  @tweets = @user.tweets

  if better_stale?(@user)
    if request.xhr?
     erb :tweets, layout: false
     @user.fetch_tweets
   else
    @user.tweets
    erb :tweets
  end
  erb :tweets
end
end

post "/twitter/user" do
  @handle = params[:handle]
  @radio = params[:see_followers]

  if @radio == true.to_s

    redirect "/#{@handle}"

  else
    redirect "/followers/#{@handle}"
  end
end


get "/followers/:handle" do

  @user = TwitterUser.generate(params[:handle])
  session[:user_id] = @user.id

  if better_stale?(@user)
    @followers = @user.fetch_followers
    erb :followers
  else
    @followers = @user.followers
    erb :followers
  end
end

#========= tweeting route ===========

post "/tweet/user" do

  if request.xhr?

    @user = TwitterUser.generate(params[:handle])
    @user.tweet(params[:text])

    @user.tweets << Tweet.create(text: params[:text], tweet_time: params[:tweet_time])
    @tweets = @user.tweets.limit(5)
    erb :tweets
  end
end

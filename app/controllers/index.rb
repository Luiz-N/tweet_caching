# require 'twitter'

get '/' do
  # Look in app/views/index.erb

  @all_users = User.all

  erb :index
end

get '/:user' do
  # user = 
  @user = User.find_by_handle(params[:user])


  if @user.stale?
    # @user.fetch_tweets
    @user
    erb :user_tweets_ajax
  else
    @tweets = @user.tweets
    erb :user_tweets
  end
end


post '/' do
  @user = User.find_or_create_by_handle(params[:user])

  redirect '/'
end

post '/fetch' do
  p params["user"]
  @user = User.find_or_create_by_handle(params["user"])
  @user.fetch_tweets
  @user.tweets.to_json
  

end

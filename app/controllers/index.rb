# require 'twitter'

get '/' do
  # Look in app/views/index.erb

  @all_users = User.all

  erb :index
end

get '/:user' do
  # user = 
  @user = User.find_by_handle(params[:user])

  @user.fetch_tweets if @user.stale?
  @tweets = @user.tweets
  
  p @tweets.count
  erb :user_tweets

end


post '/' do
  @user = User.find_or_create_by_handle(params[:user])

  redirect '/'
end

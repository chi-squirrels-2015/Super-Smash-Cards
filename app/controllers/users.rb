get "/" do
  redirect "/users"
end

get "/users" do
  session.clear
  erb :index
end

post "/users" do
  @user = User.authenticate(params[:username], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect '/decks'
  else
    erb :index
  end
end

get "/users/signup" do
  erb :"users/signup"
end

post "/users/signup" do
  @user = User.create!(params[:user])
  session[:user_id] = @user.id
  redirect '/decks'
end

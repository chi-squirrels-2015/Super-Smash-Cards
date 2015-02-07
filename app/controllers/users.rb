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
  "show the form on how to make a new user"
  erb :signup
end

post "/users/signup" do
  "get information from sign up page, store that in database, and then redirect them to decks page"
  redirect '/decks'
end

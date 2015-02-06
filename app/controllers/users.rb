get "/" do
  erb :index
end

post "/users" do
  "get the information form the login page and then check if that user is in the database and then forward them to the decks page"
  redirect '/decks'
end

get "/users/signup" do
  "show the form on how to make a new user"
  erb :signup
end

post "/users/signup" do
  "get information from sign up page, store that in database, and then redirect them to decks page"
  redirect '/decks'
end

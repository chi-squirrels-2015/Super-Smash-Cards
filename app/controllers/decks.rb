get "/decks" do
  if session[:user_id]
    @decks = Deck.all
    erb :"decks/index"
  else
    session.clear
    redirect "/users"
  end
end

get "/decks/congratulations" do
  if session[:user_id]
    @user = User.find(session[:user_id])
    erb :"decks/congrats"
  else
    session.clear
    redirect "/users"
  end
end

get "/decks" do
  if session[:user_id]
    @decks = Deck.all
    erb :"decks/index"
  else
    session.clear
    redirect "/users"
  end
end

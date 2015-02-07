get "/decks" do
  @decks = Deck.all
  erb :"decks/index"

  # if session[:user_id]
  #   @decks = Deck.all
  #   erb :"decks/index"
  # else
  #   session.clear
  #   redirect "/"
  # end
end

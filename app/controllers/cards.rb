get "/decks/:deck_title/cards" do
  if session[:user_id]
    @user = User.find(session[:user_id])
    @deck = Deck.find_by(title: params[:deck_title])
    erb :"cards/show_cards"
  else
    session.clear
    redirect "/users"
  end
end

get "/decks/:deck_title/cards/:id" do
  @deck = Deck.find_by(title: params[:deck_title])
  @card = @deck.cards[params[:id].to_i]
  @deck_position = params[:id].to_i
  erb :"cards/show_question"
end

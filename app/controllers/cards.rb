get "/decks/:deck_title/cards" do
  puts params[:user_id]
  @deck = Deck.find_by(title: params[:deck_title])
  erb :"cards/show_cards"
end

get "/decks/:deck_title/cards/:id" do
  @deck = Deck.find_by(title: params[:deck_title])
  @card = @deck.cards[params[:id].to_i]
  @deck_position = params[:id].to_i
  erb :"cards/show_question"
end

get "/decks/:deck_title/cards" do
  "show all the cards in decks"
end

get "/decks/:deck_title/cards/:id" do
  @deck = Deck.find_by(title: params[:deck_title])
  @card = Card.find(params[:id])
  erb :"cards/show_question"
end

# get "/deck/:deck_title/game" do
#   @deck = Deck.find_by[title: params[:deck_title]]
#   @cards = @deck.cards
#   @question = @cards.first.question

#   erb :game
# end

get "/decks/:deck_title/cards/:id/answer" do
  @deck = Deck.find_by(title: params[:deck_title])
  @card = Card.find(params[:id])
  erb :"cards/show_answer"
end

post "/decks/:deck_title/cards/:id/answer" do
  @deck = Deck.find_by(title: params[:deck_title])
  @card = Card.find(params[:id])
  if params[:answer] == @card.answer
    if Card.exists?(params[:id].to_i + 1)
      redirect "/decks/#{@deck.title}/cards/#{@card.id.to_i + 1}"
    else
      redirect "/decks/congratulations"
    end
  else
    @wrong = true
    erb :"cards/show_question"
  end
end

get "/decks/:deck_title/cards/:id/skip" do
  @deck = Deck.find_by(title: params[:deck_title])
  @card = Card.find(params[:id])
  if Card.exists?(params[:id].to_i + 1)
      redirect "/decks/#{@deck.title}/cards/#{@card.id.to_i + 1}"
  else
      redirect "/decks/congratulations"
  end
end

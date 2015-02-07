post "/cards/show_cards" do
  if session[:user_id]
    user = User.find(session[:user_id])
    deck = Deck.find_by(title: params[:deck_title])
    new_game = Game.create!(user_id: user.id, deck_id: deck.id)
    @game = Game.find(new_game.id)
    @deck = @game.deck
    @card = @game.current_card
    erb :"cards/show_question"
  end
end

# post "/:username/games" do
#   "gets info from the decks/index.erb to find out if the game has already been made or needs to be made"
#   Game.create(params[:game])
# end

get "/:username/games/:game_id" do
  @game = Game.find(params[:game_id])
  @deck = @game.deck
  @card = @game.current_card
  erb :"cards/show_question"
end

get "/:username/games/:game_id/answer" do
  @game = Game.find(params[:game_id])
  @deck = @game.deck
  @card = @game.current_card
  erb :"cards/show_answer"
end

post "/:username/games/:game_id" do
  @game = Game.find(params[:game_id])
  @deck = @game.deck
  @card = @game.current_card
  if params[:answer] == @card.answer
    if @deck.cards[@game.current_card.id]
      @game.deck_position += 1
      @game.cards_completed += 1
      @game.save
      redirect "/#{@game.user.username}/games/#{@game.id}"
    else
      @game.deck_position = 0
      @game.cards_completed = 0
      @game.cards_skipped = 0
       # Testing purposes, but need to implement somehow. Remove this line and after until the redirect.
      @game.save
      redirect "/decks/congratulations" # Need to implement this page
    end
  else
    @wrong = true
    erb :"cards/show_question"
  end
end

get "/:username/games/:game_id/skip" do
  @game = Game.find(params[:game_id])
  @deck = @game.deck
  @card = @game.current_card
  if @deck.cards[@game.current_card.id + 1]
    @game.deck_position += 1
    @game.cards_skipped += 1
    @game.save
    redirect "/#{@game.user.username}/games/#{@game.id}"
  else
    redirect "/decks/congratulations"
  end
end

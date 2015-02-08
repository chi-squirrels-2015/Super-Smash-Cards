post "/games/new_game" do
  if session[:user_id]
    @user = User.find(session[:user_id])
    @deck = Deck.find_by(title: params[:deck_title])
    # Creates a new game for the user by using method that is at the bottom of code
    create_new_game(@user, @deck)
  else
    session.clear
    redirect "/login"
  end
end

post "/games/continue/:deck_title" do
  @deck = Deck.find_by(title: params[:deck_title])
  if session[:user_id]
    # Checks if there is a game that can be continued from the user that is logged in, otherwise show them the same page that shows all cards of deck.
    if Game.where(user_id: session[:user_id]).length == 0
      @no_continue = true
      return erb :"cards/show_cards"
    else
      @user = User.find(session[:user_id])
      @games = Game.where(user_id: session[:user_id])
      erb :"games/continue"
    end
  else
    session.clear
    redirect "/login"
  end
end

get "/games/:game_id/congratulations" do
  if session[:user_id]
    @user = User.find(session[:user_id])
    @game = Game.find(params[:game_id])
    @deck = @game.deck
    erb :"decks/congrats"
  else
    session.clear
    redirect "/users"
  end
end

get "/games/:game_id" do
  @game = Game.find(params[:game_id])
  @deck = @game.deck
  @card = @game.current_card
  if @game.cards_completed + @game.cards_skipped == @game.cards.length
    redirect "/games/#{params[:game_id]}/congratulations"
  else
    erb :"cards/show_question"
  end
end

get "/games/:game_id/answer" do
  @game = Game.find(params[:game_id])
  @deck = @game.deck
  @card = @game.current_card
  erb :"cards/show_answer"
end

post "/games/:game_id" do
  @game = Game.find(params[:game_id])
  @deck = @game.deck
  @card = @game.current_card
  if params[:answer] == @card.answer
    if @deck.cards[@game.current_card.id]
      @game.deck_position += 1
      @game.cards_completed += 1
      @game.save
      redirect "/games/#{@game.id}"
    else
      @game.deck_position += 1
      @game.cards_completed += 1
      @game.save
      redirect "/games/#{@game.id}/congratulations"
    end
  else
    @wrong = true
    erb :"cards/show_question"
  end
end

get "/games/:game_id/skip" do
  @game = Game.find(params[:game_id])
  @deck = @game.deck
  @card = @game.current_card
  if @deck.cards[@game.current_card.id]
    @game.deck_position += 1
    @game.cards_skipped += 1
    @game.save
    redirect "/games/#{@game.id}"
  else
    @game.deck_position += 1
    @game.cards_skipped += 1
    @game.save
    redirect "/games/#{@game.id}/congratulations"
  end
end

def create_new_game(user, deck)
  new_game = Game.create!(user_id: user.id, deck_id: deck.id)
    @game = Game.find(new_game.id)
    @deck = @game.deck
    @card = @game.current_card
    redirect "/games/#{@game.id}"
  end

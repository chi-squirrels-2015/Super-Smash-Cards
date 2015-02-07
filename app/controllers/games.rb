# get "/games/new" do
#   erb :"games/new"
# end

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

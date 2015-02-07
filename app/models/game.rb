class Game < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :deck
  has_many :cards, through :deck
  def current_card
    Game.cards[:deck_position]
  end
end

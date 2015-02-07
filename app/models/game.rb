class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  has_many :cards, through: :deck
  def current_card
    self.deck.cards[self.deck_position]
  end
end

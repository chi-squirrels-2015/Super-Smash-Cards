class Deck < ActiveRecord::Base
  has_many :cards
  has_many :games
  has_many :users, through: :games
end

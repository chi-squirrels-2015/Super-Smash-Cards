class User < ActiveRecord::Base
  has_many :games
  has_many :decks, through: :games
  has_many :cards, through: :decks

  def self.authenticate(username, password)
    User.find_by(username: username, password: password)
  end

end

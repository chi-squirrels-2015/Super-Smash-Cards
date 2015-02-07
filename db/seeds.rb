require_relative 'world_card_seed'

User.create!(username: "Kyoon", password: "1234")
User.create!(username: "Jmandal", password: "abcd")
User.create!(username: "Bsheridan", password: "wxyz")

deck = Deck.create!(title: "TestDeck")

deck.cards = [
Card.create!(question: "Who is the creator?", answer: "Brian"),
Card.create!(question: "Who is RubyBuddah?", answer: "Leon"),
Card.create!(question: "Who is the best Super Smash Brother character?", answer: "Link"),
Card.create!(question: "Who is the Squirrel King?", answer: "Nate"),
Card.create!(question: "Who runs the world?", answer: "Squirrels")
]

deck.save

 # This needs to be implemented in the controllers/views
Game.create!(user_id: 1, deck_id: 1)
Game.create!(user_id: 1, deck_id: 2)

# makes deck of world capitals
d = Deck.create!(title: "Capitals of the World")
d.cards = CountryCapitals::world_capitals.map{|country| Card.create!(country)}
d.save

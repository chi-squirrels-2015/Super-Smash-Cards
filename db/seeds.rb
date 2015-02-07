require_relative 'world_card_seed'

User.create(username: "Kyoon", password: "1234")
User.create(username: "Jmandal", password: "abcd")
User.create(username: "Bsheridan", password: "wxyz")

deck = Deck.create(title: "TestDeck")

deck.cards = [
Card.create(question: "Who is the creator?", answer: "Brian"),
Card.create(question: "Who is RubyBuddah?", answer: "Leon"),
Card.create(question: "Who is the best Super Smash Brother character?", answer: "Link"),
Card.create(question: "Who is the Squirrel King?", answer: "Nate"),
Card.create(question: "Who runs the world?", answer: "Squirrels")
]

deck.save

# WORLD CAPITALS
# makes deck of World capitals
d = Deck.create!(title: "Capitals of the World")
d.cards = CountryCapitals::world_capitals.map{|country| Card.create!(country)}
d.save

# makes deck of Asian capitals
d = Deck.create!(title: "Capitals of Asia")
d.cards = CountryCapitals::capitals_by_region("Asia").map{|country| Card.create!(country)}
d.save

# makes deck of European capitals
d = Deck.create!(title: "Capitals of Europe")
d.cards = CountryCapitals::capitals_by_region("Europe").map{|country| Card.create!(country)}
d.save

# makes deck of Americas capitals
d = Deck.create!(title: "Capitals of the Americas")
d.cards = CountryCapitals::capitals_by_region("Americas").map{|country| Card.create!(country)}
d.save

# makes deck of Africa capitals
d = Deck.create!(title: "Capitals of Africa")
d.cards = CountryCapitals::capitals_by_region("Africa").map{|country| Card.create!(country)}
d.save

# makes deck of Oceania capitals
d = Deck.create!(title: "Capitals of Oceania")
d.cards = CountryCapitals::capitals_by_region("Oceania").map{|country| Card.create!(country)}
d.save


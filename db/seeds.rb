
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

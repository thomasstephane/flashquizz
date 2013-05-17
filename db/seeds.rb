require 'faker'

3.times do 
  deck = Deck.create(name: Faker::Name.first_name)

  3.times do
    card = Card.create(answer: Faker::Name.first_name, 
                question: Faker::Name.first_name,
                choice2: Faker::Name.first_name,
                choice3: Faker::Name.first_name,
                choice4: Faker::Name.first_name
                )
    deck.cards << card
  end

end

5.times do 
  User.create(username: Faker::Internet.user_name, password: "123")
end

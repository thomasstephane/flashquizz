@file = {"cards.txt" => "Ruby Terms", "states.txt" => "State Capitals"}



def seed_wrong_answers(card, answers)
  card.choice2 = answers.select{|ans| ans != card.answer}.sample
  card.choice3 = answers.select{|ans| ans != card.answer && ans != card.choice2 }.sample
  card.choice4 = answers.select{|ans| ans != card.answer && ans != card.choice2 && ans != card.choice3}.sample
end

def generate_deck(file, name)

  deck = Deck.create(name: name)

  line_array = File.readlines(file,"\n\n").map { |a| a.split("\n") }
  line_array.each { |pair| Card.create(question: pair[0], answer: pair[1], deck_id: deck.id) }

  wrong_answers = []
  Card.all.each do |card|
    wrong_answers << card.answer if card.deck_id == deck.id
  end
  seeding_checking_choices(wrong_answers, deck)

end

def seeding_checking_choices(wrong_answers, deck)
  Card.all.each do |card|
    seed_wrong_answers(card, wrong_answers) if  card.deck_id == deck.id
    card.save
  end
end


@file.each do |file, name|
  generate_deck(file, name)
end

class Deck < ActiveRecord::Base
  has_many :games 
  has_many :cards
  has_many :users, :through=> :games 
  validates :name, :uniqueness => true

  def deck
    @all_cards = self.cards
  end

  def next_card(card_id)
    self.deck
    card_index = 0
    @all_cards.each_with_index do |card, index|
      card_index = index + 1 if card.id == card_id.to_i
    end
    card = @all_cards[card_index] 
    card ? card.id : false
  end

end

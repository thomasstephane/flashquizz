class Deck < ActiveRecord::Base
  has_many :games 
  has_many :cards
  has_many :users, :through=> :games 
  validates :name, :uniqueness => true

  def next_card(card_id)
  	
end

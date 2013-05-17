class User < ActiveRecord::Base
  has_many :games
  has_many :decks, :through=> :games 
  validates :username, :uniqueness => true, :presence => true
end

class User < ActiveRecord::Base
  has_many :games
  has_many :decks, :through=> :games 
end

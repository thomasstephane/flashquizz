class Card < ActiveRecord::Base
  belongs_to :deck

  validates :question, :answer, :presence => true
end

class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck  
  validates :user_id, :deck_id, :presence => true

	after_initialize :init

  def init
  	self.cards_shown ||= 0
  	self.cards_correct ||= 0
  end
end

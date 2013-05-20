class Card < ActiveRecord::Base
  belongs_to :deck

  validates :question, :answer, :presence => true

  def check(user_answer)
  	self.answer.split(" ")[0] == user_answer
  end

end

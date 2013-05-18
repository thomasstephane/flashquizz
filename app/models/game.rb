class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck  
  validates :user_id, :deck_id, :presence => true

	after_initialize :init

  def init
  	self.cards_shown ||= 0
  	self.cards_correct ||= 0
  end

  def score
  	if self.cards_shown == 0
  		0
  	else
  		@score = self.cards_correct.to_f / self.cards_shown.to_f
  	end
  end

  def progression(card, user_answer)
  	if card.check(user_answer)
			self.cards_correct += 1
		else
			"wrong answer"
		end
		self.cards_shown += 1
		self.save
	end

	def get_users
		Game.where("deck_id = ?", self.deck_id)
	end

	def user_name
		user = User.find_by_id(self.user_id)
		user.username
	end


	def rank_list
		list = []
		get_users.each do |game|
			list << { name: game.user_name, score: game.score }
		end
		list
	end

	def sorted_rank_list
		rank_list.sort_by {|user_score| user_score[:score] }
	end

end

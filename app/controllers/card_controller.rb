get '/game/:game_id/:card_id' do |game_id, card_id|
	if card_id == "final"
		erb :final 
	else
		@card = Card.find_by_id(card_id)
		@choices = [@card.answer, @card.choice2, @card.choice3, @card.choice4].shuffle
		@game = Game.find_by_id(game_id)
		erb :card
	end
end

post '/game/:game_id/:card_id' do |game_id, card_id|
	p card_id
	@card = Card.find_by_id(card_id)
	@game = Game.find_by_id(game_id)

	if Card.find_by_id(card_id.to_i + 1)
		if @card.check(params[:answer])
			@card.cards_correct += 1
		else
			"wrong answer"
		end
		@game.cards_shown += 1
		redirect "/game/#{game_id}/#{card_id.to_i + 1}"
	else
		redirect "/game/#{game_id}/final"
	end
	
end


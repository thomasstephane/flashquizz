get '/game/:game_id/:card_id' do |game_id, card_id|
	@game = Game.find_by_id(game_id)
	@user = User.find_by_id(session[:id])
	if card_id == "final"
		erb :final 
	else
		@card = Card.find_by_id(card_id)
		@choices = [@card.answer, @card.choice2, @card.choice3, @card.choice4].shuffle
		erb :card
	end
end

post '/game/:game_id/:card_id' do |game_id, card_id|
	@card = Card.find_by_id(card_id)
	@game = Game.find_by_id(game_id)
	@deck = @game.deck_id
	@user_answer = params[:answer]
	@game.progression(@card, @user_answer)

	if Card.find_by_id(@deck.next_card(card_id))
		redirect "/game/#{game_id}/#{card_id.to_i + 1}"
	else
		redirect "/game/#{game_id}/final"
	end
	
end


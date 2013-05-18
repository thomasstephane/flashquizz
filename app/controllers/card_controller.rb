get '/game/:game_id/:card_id' do |game_id, card_id|
	@game = Game.find(game_id)
	@user = User.find(session[:id])
	if card_id == "final"
		erb :final 
	else
		@card = Card.find(card_id)
		@choices = [@card.answer, @card.choice2, @card.choice3, @card.choice4].shuffle
		erb :card
	end
end

post '/game/:game_id/:card_id' do |game_id, card_id|
	@card = Card.find(card_id)
	@game = Game.find(game_id)
	@deck = Deck.find(@game.deck_id)
	@user_answer = params[:answer]
	@game.progression(@card, @user_answer)

	if @deck.next_card(card_id)
		redirect "/game/#{game_id}/#{@deck.next_card(card_id)}"
	else
		redirect "/game/#{game_id}/final"
	end
	
end



get '/create_game/:deck_id' do |deck_id|
  game = Game.new
  game.deck_id = deck_id.to_i
  game.user_id = session[:id]
  @deck = Deck.find(deck_id.to_i)
  p @deck.deck
  game.save
  redirect "/game/#{game.id}/#{@deck.deck[0].id}"
end




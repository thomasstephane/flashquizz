get '/create_game/:deck.id' do |deck_id|
  game = Game.new
  game.deck_id = deck_id.to_i
  game.user_id = session[:id]
  game.save
  redirect '/game/#{game.id}/#{game.deck_id.first}'
end

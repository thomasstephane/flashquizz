get '/create_game/:deck_id' do |deck_id|
  game = Game.new
  game.deck_id = deck_id.to_i
  game.user_id = session[:id]
  deck
  session[:all_cards] = @all_cards
  game.save
  redirect "/game/#{game.id}/1"
end

def deck
  @all_cards = []
  Card.all do |card|
    if card.deck_id == params[:deck_id]
      @all_cards << card
    end
  end
end


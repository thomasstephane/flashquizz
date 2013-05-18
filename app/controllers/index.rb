get '/' do
  erb :index
end

post '/' do
  user = User.find_by_username(params[:username])
  if params[:password] == user.password
    session[:id] = user.id
    session[:decks] = Deck.all
    redirect '/'
  else
    redirect '/'
  end
end

get '/create_game/:deck_id' do |deck_id|
  game = Game.new
  game.deck_id = deck_id.to_i
  game.user_id = session[:id]
  game.save
  redirect "/game/#{game.id}/1"
end

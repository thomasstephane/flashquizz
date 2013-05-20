get '/create_user' do
  erb :create_user
end

post '/create_user' do
  new_user = User.create(params["user"])
  session[:id] = new_user.id
  session[:decks] = Deck.all
  redirect '/'
end

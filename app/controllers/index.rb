get '/' do
  erb :index
end

post '/' do
  user = User.find_by_password(params[:password])
  if params[:password] == user.password
    session[:id] = user.id
  else
    redirect '/'
  end
end

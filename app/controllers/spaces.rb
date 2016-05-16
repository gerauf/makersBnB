class MakersBnB < Sinatra::Base
  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    Space.create(name: params[:name])
    redirect '/'
  end
end

class MakersBnB < Sinatra::Base
  get '/spaces/new' do
    erb :'spaces/new'
  end
end

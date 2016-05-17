class MakersBnB < Sinatra::Base
  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    space = current_user.spaces.create(name: params[:name],
                 description: params[:description],
                 price: params[:price])
    space.save
    redirect '/'
  end
end

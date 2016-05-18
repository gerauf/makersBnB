class MakersBnB < Sinatra::Base

  get '/spaces' do
    @spaces = Space.all
    erb :index
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    space = current_user.spaces.create(name: params[:name],
                 description: params[:description],
                 price: params[:price])
    space.save
    redirect '/spaces'
  end
  
end

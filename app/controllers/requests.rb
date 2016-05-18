class MakersBnB < Sinatra::Base

  post '/requests' do
    space_id = params[:space_id]
    user_id = current_user.id
    Request.create(user_id: user_id, space_id: space_id)
    redirect '/spaces'
  end

  get '/requests' do
    erb :'requests/index'
  end

end

class MakersBnB < Sinatra::Base

  post '/requests' do
    space_id = params[:space_id].to_i
    user_id = current_user.id
    Request.first_or_create(user_id: user_id,
                            space_id: space_id) unless own_space? space_id
    redirect '/spaces'
  end

  get '/requests' do
    @requests_made = Request.all(user_id: current_user.id)
    arr= []
    owned_spaces = Space.all(user_id: current_user.id)
    owned_spaces.each {|space| arr << space.user_id}
    if owned_spaces
      @requests_received = Request.all(space_id: arr)
    end
    erb :'requests/index'
  end
end

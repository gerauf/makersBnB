class MakersBnB < Sinatra::Base

  post '/requests' do
    if current_user
      space_id = params[:space_id].to_i
      user_id = current_user.id
      Request.first_or_create(user_id: user_id,
                              space_id: space_id) unless own_space? space_id
    end
    redirect '/spaces'
  end

  get '/requests' do
    user_spaces = current_user.spaces.inject([]) {|arr,space| arr << space.id}
    @requests_received = Request.all(space_id: user_spaces)
    @requests_made = Request.all(user_id: current_user.id)
    erb :'requests/index'
  end
end

class MakersBnB < Sinatra::Base

  post '/requests' do
    if current_user && session[:dates]
      space_id = params[:space_id].to_i
      user_id = current_user.id
      start_date = session[:dates].first
      end_date = session[:dates].last
      Request.first_or_create(user_id: user_id,
                              space_id: space_id,
                              start_date: start_date,
                              end_date: end_date) unless own_space? space_id
      flash.now[:notice] = "Request made"
    else
      flash.now[:notice] = "Please select dates for booking request!"
    end
    redirect '/spaces'
  end

  get '/requests' do
    user_spaces = current_user.spaces.inject([]) {|arr,space| arr << space.id}
    @requests_received = Request.all(space_id: user_spaces)
    @requests_made = Request.all(user_id: current_user.id)
    erb :'requests/index'
  end

  put '/requests/confirm/:id' do
    current_request = Request.first(id: params['id'])
    current_request.booked = true
    current_request.save
    redirect '/requests'
  end

  delete '/requests/deny/:id' do
    Request.first(id: params['id']).destroy
    redirect '/requests'
  end


end

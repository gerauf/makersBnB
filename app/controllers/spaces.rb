class MakersBnB < Sinatra::Base

  get '/spaces' do
    available_spaces = session[:available_spaces]
    dates = session[:dates]
    @spaces = available_spaces ? Space.all(id: available_spaces) : Space.all
    @dates = dates ? dates : ["",""]
    erb :'spaces/index'
  end

  post '/spaces/search' do
    search = Availability.all(:start_date.lte => params[:start_date],
                                 :end_date.gte => params[:end_date])
    session[:dates] = [params[:start_date], params[:end_date]]
    session[:available_spaces] = search.inject([]){|arr,el| arr << el.space_id}
    redirect '/spaces'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    space = current_user.spaces.create(name: params[:name],
                                        description: params[:description],
                                        price: params[:price])
    availability = space.availabilities.create(start_date: params[:start_date],
                                                 end_date: params[:end_date])
    redirect '/spaces'
  end
end

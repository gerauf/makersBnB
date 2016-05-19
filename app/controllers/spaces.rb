class MakersBnB < Sinatra::Base

  get '/spaces' do
    search = session[:search_criteria]
    dates = session[:dates]
    @spaces = search ? Space.all(id: search) : Space.all
    @dates = dates ? dates : ["",""]
    erb :'spaces/index'
  end

  post '/spaces/search' do
    available = Availability.all(:start_date.lte => params[:start_date],
                                 :end_date.gte => params[:end_date])
    arr = []
    available.each {|el| arr << el.space_id}
    session[:dates] = [params[:start_date], params[:end_date]]
    session[:search_criteria] = arr
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

class MakersBnB < Sinatra::Base
  enable :sessions

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(first_name: params[:first_name],
            last_name: params[:last_name],
            email: params[:email],
            password: params[:password],
            password_confirmation: params[:password_confirm])
    session[:user_id] = user.id
    redirect to '/'
  end

end

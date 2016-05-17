class MakersBnB < Sinatra::Base

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(first_name: params[:first_name],
            last_name: params[:last_name],
            email: params[:email],
            password: params[:password],
            password_confirmation: params[:password_confirm])
    session[:user_id] = @user.id
    if @user.save
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

end

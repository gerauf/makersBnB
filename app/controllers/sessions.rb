class MakersBnB < Sinatra::Base


  get '/sessions/new' do
      erb :'sessions/new'
  end


  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Log Out complete. Thanks!'
    redirect '/spaces'
   end

  post '/sessions' do
    @user = User.authenticate(params[:login_email], params[:login_password])
    if @user
      session[:user_id] = @user.id
    # else
    #   flash.now[:errors] = @user.errors.full_messages
    end
    redirect '/spaces'
  end
end

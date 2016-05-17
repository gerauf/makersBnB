class MakersBnB < Sinatra::Base

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Log Out complete. Thanks!'
    redirect '/'
   end

  post '/sessions' do
    user = User.authenticate(params[:login_email], params[:login_password])
    if user
      session[:user_id] = user.id
      flash.now[:errors] = ["Log in successful!"]
      redirect '/'
    end
  end
end

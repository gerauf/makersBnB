class MakersBnB < Sinatra::Base

delete '/sessions' do
  session[:user_id] = nil
  flash.keep[:notice] = 'Log Out complete. Thanks!'
  redirect '/'
 end



end

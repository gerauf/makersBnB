class MakersBnB < Sinatra::Base
  use Rack::MethodOverride
  set :root, File.join(File.dirname(__FILE__))
  enable :sessions
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def own_space? space_id
      current_user.id == Space.get(space_id).user_id
    end
  end

end

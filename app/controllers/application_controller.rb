class ApplicationController < ActionController::Base
    protect_from_forgery
    helper_method :current_user, :logged_in?, :require_login
    
    def current_user
        @current_user||= User.find_by(:id => session[:user_id]) if !!session[:user_id] 
      end

      def logged_in?
        byebug
        !!session[:user_id]
      end

      def require_login
        unless logged_in?
            #byebug
            flash[:error] = "Please log in"
            redirect_to "/login"
        end
    end
   private
   def user_params
       params.require(:user).permit(:username, :name, :password, :email)
   end

end

class ApplicationController < ActionController::Base
    helper_method :logged_in?, :require_login, :current_user, :allowed_user
    
    def current_user
      @current_user||= User.find_by(:id => session[:user_id]) #if !!session[:user_id] 
    end

      def logged_in?
        #byebug
        !!session[:user_id]
      end

      def require_login
        unless logged_in?
            #byebug
            flash[:error] = "Please log in"
            redirect_to "/login"
        end
    end

    def allowed_user(params_user, page)
     if current_user == params_user
      #byebug
        render page
     else 
        flash[:error] = "Oops! Access Denied"
        redirect_to '/login'
      end
    end

   #private
   #def user_params
   #    params.require(:user).permit(:username, :name, :password, :email)
   #end

end

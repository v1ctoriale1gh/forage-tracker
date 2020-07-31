class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        if auth_hash ||= auth
          @user = User.find_or_create_by_omniauth(auth_hash)
          if @user.save
            session[:user_id] = @user.id
          else 
            render :new
          end
        else
          @user = User.find_by(credentials)
          if !!@user && @user.authenticate(params[:password])
              session[:user_id] = @user.id
          else
            #byebug
            @user = User.new.tap{|u| u.errors.add(:email, "or password is invalid")}
            render :new
          end
        end
        #byebug
        redirect_to user_path(current_user)
      end

      def destroy
        reset_session
        redirect_to root_path
      end

      private

      def auth
        request.env['omniauth.auth']
      end

      def credentials
       { email: params[:email] }
      end

      def reset_session
        session.delete(:user_id)
      end

end

class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        if !!( auth_hash = auth )
          @user = User.find_or_create_by_omniauth(auth_hash)
          if @user.persisted? then session[:User_id] = @user.id
          else render :new and return
          end
        else
          @user = User.find_by(credentials)
          if ( !!@user && @user.authenticate(user_params[:password]) )
            session[:user_id] = @user.id
          else
            @user = User.new.tap{|u| u.errors.add(:username, "or password is invalid")}
            render :new and return
          end
        end
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
        { username: user_params[:username] }
      end

      def reset_session
        session.delete(:User_id)
      end

end

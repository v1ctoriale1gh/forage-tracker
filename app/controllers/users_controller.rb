class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def show
        @user = User.find_by(id: params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        render_or_redirect(:new)
    end

    def edit
        @user = User.find_by(id: params[:id])
    end
    
    def update
      @user = User.find_by(id: params[:id])
      @user.update(user_params)
      render_or_redirect(:edit)
    end

    private

    def user_params
        params.require(:user).permit(:username, :name, :password, :email_address)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def render_or_redirect(page)
        if @user.save
            redirect_to user_path(@user)
          else
            render page
          end
    end

end

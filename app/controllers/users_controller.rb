class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
        if !!params[:search]
            byebug
        @users = User.where("name like ?", params[:search])
        else
            byebug
        @users = User.all
        end
    end

    def show
        require_login
        allowed_user(@user, :show)
        @user = User.find_by(id: params[:id])
    end

    def new
        #byebug
        @user = User.new
    end

    def create
        #byebug
        @user = User.create(user_params)
        render_or_redirect(:new)
    end

    def edit
        require_login
        @user = User.find_by(id: params[:id])
    end
    
    def update
        require_login
      @user = User.find_by(id: params[:id])
      @user.update(user_params)
      render_or_redirect(:edit)
    end

    private

    def user_params
        params.require(:user).permit(:username, :name, :password, :email)
    end


    def set_user
        @user = User.find(params[:id])
    end

    def render_or_redirect(page)
        if @user.persisted?
            session[:user_id] = @user.id
            #byebug
            redirect_to user_path(@user)
          else
            render page
          end
    end

end

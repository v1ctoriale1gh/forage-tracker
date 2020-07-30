class ItemsController < ApplicationController
    before_action :set_user, except: [:show]
    def show
        @item = Item.find(params[:id])
    end

    def index
        require_login
        allowed_user(@user, :index)
    end

    def items_by_location
        #byebug
        require_login
        allowed_user(@user, :items_by_location)
    end

    def items_by_name
        require_login
        allowed_user(@user, :items_by_name)
    end

    private

    def set_user
        @user = User.find(params[:user_id])
    end
end

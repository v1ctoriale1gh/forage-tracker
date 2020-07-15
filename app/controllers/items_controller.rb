class ItemsController < ApplicationController
    before_action :set_user, except: [:show]
    def show
        @item = Item.find(params[:id])
    end

    def index
        require_login
    end

    def items_by_location
        require_login
    end

    def items_by_name
        require_login
    end

    private

    def set_user
        @user = User.find(params[:user_id])
    end
end

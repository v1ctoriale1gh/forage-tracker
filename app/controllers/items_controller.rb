class ItemsController < ApplicationController
    before_action :set_user, except: [:show]
    def show
        byebug
        @item = Item.find(params[:id])
    end

    def index
    end

    def items_by_location
    end

    def items_by_name
    end

    private

    def set_user
        @user = User.find(params[:user_id])
    end
end

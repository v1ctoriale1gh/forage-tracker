class ExpeditionsController < ApplicationController
    before_action :require_login
    before_action :set_expedition, only: [:show, :edit, :update, :destroy]
    before_action :set_user

    def show
        allowed_user(@user, :show)
        #byebug
    end

    def index
        allowed_user(@user, :index)
        redirect_to user_path(@user)
    end

    def new
        @expedition = Expedition.new
        5.times do
            @expedition.harvests.build
            @expedition.items.build
        end
        allowed_user(@user, :new)
    end

    def create
        #byebug
        @expedition = Expedition.new(expedition_params)
        @expedition.user = @user
        #byebug
        render_or_redirect(:new)
    end

    def edit
        allowed_user(@user, :edit)
    end

    def update
       @expedition.update(expedition_params)
       render_or_redirect(:edit)
    end

    private

    def expedition_params
        params.require(:expedition).permit(:location_name, :date_and_time, :street_number, :street, :city, :state, :country, :zipcode, :latitude, :longitude, :description, :picture, harvests_attributes: [:amount, :item_id, item_attributes: [:name, :description]])
    end

    def set_expedition
        @expedition = Expedition.find(params[:expedition_id] || params[:id])
    end

    def set_user
        @user = User.find_by(id: params[:user_id])
    end

    def render_or_redirect(page)
      if @expedition.save
        #byebug
        redirect_to "/users/#{@user.id}/expeditions/#{@expedition.id}"
      else
        render page
      end
    end

end

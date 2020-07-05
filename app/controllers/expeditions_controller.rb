class ExpeditionsController < ApplicationController
    before_action :set_expedition, only: [:show, :edit, :update, :destroy]
    before_action :set_user

    def show
    end

    def index
        redirect_to user_path(@user)
    end

    def new
        @expedition = Expedition.new
        @harvest = Harvest.new
        @item = Item.new
    end

    def create
        @expedition = Expedition.new(expedition_params(:location_name, :date_and_time, :picture, :latitude, :longitude, :description, ))
        @expedition.user = User.find_by(id: params[:user_id])
        render_or_redirect(:new)
    end

    def edit
    end

    def update
       @expedition.update(expedition_params(:location_name, :date_and_time, :picture, :latitude, :longitude, :description))
       render_or_redirect(:edit)
    end

    private

    def expedition_params(*args)
        params.require(:expedition).permit(*args)
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

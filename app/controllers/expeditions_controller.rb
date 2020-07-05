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
          5.times do
              @expedition.items.build
              @expedition.harvests.build
          end
    end

    def create
        #byebug
        @expedition = Expedition.new(expedition_params(:location_name, :date_and_time, :picture, :latitude, :longitude, :description))
        expedition_params(:harvests).each do |attributes|
        @harvest = Harvest.new(attributes(:amount))
          if item_id != ""
              @harvest.item_id = attributes(:item_id)
          else
              @item = Item.new(attributes(:item), user_id: @user.id)
              @harvest.item_id = @item.id
          end
        end
        @expedition.user = User.find_by(id: params[:user_id])
        render_or_redirect(:new)
    end

    def edit
        @new_items = [Item.new, Item.new, Item.new, Item.new, Item.new]
        @harvests = @expedition.harvests
        @items = @user.items
    end

    def update
       @expedition.update(expedition_params)
       render_or_redirect(:edit)
    end

    private

    def expedition_params(*args)
        params.require(:expedition).permit(*args)
        #(:location_name, :date_and_time, :picture, :latitude, :longitude, :description, harvests: [:amount, :item_id, item: [:name, :description]] )
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

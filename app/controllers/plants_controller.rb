class PlantsController < ApplicationController

    def index
        plants= Plant.all
        render json: plants, execpt: [:created_at, :updated_at]
    end

    def show
        plant= Plant.find(params[:id])
        if plant
            render json: plant, execpt: [:created_at, :updated_at]
        else
            render json: "Plant not found"
        end
    end

    def create
        plant= Plant.create(plant_params)
        render json: plant, execpt: [:created_at, :updated_at], status: :created
    end

    private

    def plant_params
        params.permit(:name, :image, :price)
    end 

end

class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_camper_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index 
        campers = Camper.all 
        render json: campers, status: :ok
    end

    def show 
        camper = Camper.find(params[:id])
         render json: camper, status: :not_found #any ID related search you want to use find instead of FInd_by
    end

    def create 
        camper = Camper.create(camper_params)
        render json: camper, status: :created
    end
    
    private
    def camper_params
        params.permit(:name, :age)
    end
    
    def render_camper_not_found
        render json: {error: "Camper not found"}, status: :not_found
    end

    #create
    def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
        
    end



    

    
end

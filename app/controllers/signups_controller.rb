class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    
    def create 
        signup = Signup.create(create_params) #passing the method from line 6
        render json: signup, status: :created
    end
    private
    def create_params
        params.permit(:camper_id, :activity_id, :time)
    end

    def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
        
    end
end

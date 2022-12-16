class ActivitiesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
    
    def index 
        activities = Activity.all 
        render json: activities, status: :ok
    end

    def destroy 
        activity = Activity.find(params[:id])
        Signup.all.Where(`activity_id == #{activity.id}`).destroy
        activtiy.destroy
        render json: activity, status: :no_content
    end

    private
    def render_record_not_found
        render json: {error: "Activity not found"}, status: :not_found
    end
end

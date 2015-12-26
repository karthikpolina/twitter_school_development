class Api::ActivitiesController < ApplicationController
after_action :set_access_control_headers
#Gets the list of activities
def new
    
    if params[:role_id] == "1"

     render json: Activity.order("created_at DESC")
      else 
        
      render json: Activity.where("classroom_id = ? AND school_user_id = ?", params[:class_id], params[:user_id]).order("created_at DESC").to_json(:only => [:id, :title, :message, :created_at], :methods => [:image_url])
      #Activity.where("classroom_id = ? AND school_user_id = ?", params[:class_id], params[:user_id]).order("created_at DESC")
      #@model.to_json(:only => [:id,:name,:homephone,:cellphone], :methods => [:avatar_url])

    end

  end

private

  def set_access_control_headers
   headers['Access-Control-Allow-Origin'] = "http://localhost:8100"
   headers['Access-Control-Request-Method'] = %w{GET POST OPTIONS}.join(",")
  end

end
class Api::HomeController < ApplicationController
after_action :set_access_control_headers

def attempt_login
	
	if params[:username].present? && params[:password].present?
      found_user = SchoolUser.where(:login_id => params[:username]).first
      if found_user 
        #decrypt password (bcrypt gem is used)
        authorized_user = found_user.authenticate(params[:password])
      end# end of if found_user 
    end #end of if params

    if authorized_user
      
      session[:role_id] = authorized_user.role_id
      session[:user_id] = authorized_user.id
      session[:school_id] = authorized_user.school_id
      session[:username] = authorized_user.first_name + " " +authorized_user.last_name
  end #end of if authorized_user

render json: authorized_user

end #end of def attempt_login

private

  def set_access_control_headers
   headers['Access-Control-Allow-Origin'] = "http://localhost:8100"
   headers['Access-Control-Request-Method'] = %w{GET POST OPTIONS}.join(",")
  end

end
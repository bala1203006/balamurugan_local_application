class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def verify_admin
    	if session[:user_id] && session[:role] == "ADMIN"
    	else
    		redirect_to root_path
    	end
    end

    def verify_user
    	if session[:user_id]
    	else
    		redirect_to root_path
    	end
    end
end

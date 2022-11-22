class ApplicationController < ActionController::Base
	def is_logged_in	
		if !session[:account_id].present?
			redirect_to "/login", notice: "Please log in or Register"
		end
	end

	def is_admin
		if session[:is_admin] != 0
			redirect_to "/games", notice: "Action is forbidden"
		end	
	end
end

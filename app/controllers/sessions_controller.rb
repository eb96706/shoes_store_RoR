class SessionsController < ApplicationController
	def create # Login
		user = User.find_by(email: session_params[:email]) # email exist in db?
		if user
			if user.authenticate(session_params[:password]) # email exist in db
				session[:user_id] = user.id
				redirect_to '/shoes'
			else
				flash[:error] = 'Invalid Email/Password Combination' #bad pw
				redirect_to '/'
			end
		else
			flash[:error] = 'Invalid Email/Password Combination' #bad email
			redirect_to '/'
		end
	end

	def destroy # Logout
		session[:user_id] = nil
		redirect_to '/'
	end

	def session_params	
		params.require(:user).permit(:email, :password)

	end 
end

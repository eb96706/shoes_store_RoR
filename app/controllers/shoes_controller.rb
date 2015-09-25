class ShoesController < ApplicationController

	def index
		@user = User.find(session[:user_id])
		@shoes = Shoe.where(buyer: nil) # Find all the shoes that do NOT have a buyer
	end

	def show
		
	end

	def create
		new_shoe = Shoe.new(shoe_params)
		new_shoe.seller = User.find(session[:user_id])
		if new_shoe.save
			flash[:success]='add to db'
			redirect_to '/shoes'
		else
			flash[:errors] = new_shoe.errors.full_messages
			redirect_to '/dashboard'
		end
		
	end

	def update
		shoe = Shoe.find(params[:id])
		shoe.update(:buyer => User.find(session[:user_id])) # make buyer the logged-in user
		redirect_to '/dashboard'
	end

	def destroy
		shoe = Shoe.find(params[:id])
		shoe.destroy
		redirect_to '/dashboard'
		
	end

	private

	def shoe_params
		params.require(:shoe).permit(:name, :amount)
	end
	
end

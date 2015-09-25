class UsersController < ApplicationController

  def index
  end

  def new
  end

  def show
    @user = User.find(session[:user_id])
    # @shoes_sold = Shoe.where.not(buyer: nil)
  end

  def edit
  end

  def create
  	new_user = User.create(user_params)
  	if new_user.valid?
  		flash[:success] = 'Successfully registered!'
  		redirect_to '/'
  	else
  		flash[:errors] = new_user.errors.full_messages
  		redirect_to '/'
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end

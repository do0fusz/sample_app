class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params) 
	  	if @user.save
	  		flash[:succes] = "Welcome to the sample app"
	  		redirect_to @user
	  else
	  	 #user was niet echt succesvol
	  	 render 'new'
	  	  	flash.now[:failure] = "to bad, try again"
	  	end
  end

  def index
  	 @users = User.all 
  end

  def show
  	@user = User.find(params[:id])
  end

  private

  	def user_params
  		params.require(:user).permit(:name,:email,:password,
  			:password_confirmation)
  	end

end

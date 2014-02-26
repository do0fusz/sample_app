class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: :destroy

  def index
    @user = Users.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params) 
	  	if @user.save
	  		flash[:succes] = "Welcome to the sample app"
	  		redirect_to @user
	  else
	  	 render 'new'
	  	  	flash.now[:failure] = "to bad, try again"
	  	end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
        flash[:succes] = "User settings updated"
        redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
        User.find(params[:id]).destroy 
        redirect_to users_url
        flash[:succes] = "User succesfully destroyed"
  end



  private

  	def user_params
  		params.require(:user).permit(:name,:email,:password,
  			:password_confirmation)
  	end

## before filters

    def signed_in_user
        unless signed_in?
          store_location
        redirect_to signin_url, notice: "! --  Pleas sign in to acces this page -- !" 
      end
    end

    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to root_url unless current_user.admin?
    end

    def admin_user? 
        current_user.admin? 
    end
  
end

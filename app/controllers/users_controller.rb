class UsersController < ApplicationController
	  before_action :set_user, only: [:show, :edit, :update, :destroy]

	def new
    	@user = User.new
  	end

  	def create
   	 @user = User.new(user_params)
   	 if @user.save
   	   redirect_to users_path
   	 else
    	  render action: 'new'
    	end
  	end
    def show
  	end
  	def edit
  	end
	def index
  	  @users = User.all
  	end
  private
     def set_user
      @user = User.find(params[:id])
    end

  def user_params
    params.require(:user).permit(:name,:surname,:idcard,:nickname,:email,:phone,:city,:postalcode,:password,:alerts)
  end
end

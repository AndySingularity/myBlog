class UsersController < ApplicationController




	def index
	end


	def show
    if !user_signed_in? then
      redirect_to new_user_session_path
    end
		@user = current_user
	end


  def create
    @user = User.create(user_params)
  end



  def user_params
    params.require(:user).permit(:avatar)
  end



end

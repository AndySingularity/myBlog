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
    params.require(:user).permit(:avatar, :about)
  end

  def edit
    @user = current_user
  end

  def update
    # TODO: Переменную @user нужно сделать доступной для всех методов. DRY-метода ёпты!)
    @user = current_user
    @user.update(user_params)
    redirect_to edit_user_path
  end

end

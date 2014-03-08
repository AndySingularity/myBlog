class UsersController < ApplicationController

  before_filter do
    if !user_signed_in? then
      redirect_to new_user_session_path
    end
    @user = current_user
  end

	def index
	end

	def show
    if !user_signed_in? then
      redirect_to new_user_session_path
    end
    @articles = Article.where(:user_id => current_user.id).all.reverse
    @this_user = User.find(params[:id])
	end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :about)
  end

end

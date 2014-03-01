class ArticlesController < ApplicationController

	def create
		@user = current_user
		@article = Article.create(article_params)
		redirect_to articles_path
	end

	def edit
		@article = Article.where(:id => params[:id])[0]
		if params[:article]
			@article.update(article_params)
		end 
	end

	def show
		@user = current_user
		@article = Article.find_by(:id => params[:id])
	end

	def index
		@user = current_user
		@articles = Article.where(:user_id => current_user.id).all.reverse
	end

	def new
		@user = current_user
		# TODO: Хватит плодить сущности! >_<
	end

private

	def article_params
		params.require(:article).permit(:title, :description, :user_id)
	end

end
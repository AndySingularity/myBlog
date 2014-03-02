class ArticlesController < ApplicationController

	before_filter do
		if !user_signed_in? then
			redirect_to new_user_session_path
		end
		@user = current_user
	end

	def create
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
		@article = Article.find_by(:id => params[:id])
	end

	def index
		@articles = Article.all.reverse
	end

	def new
	end

private

	def article_params
		params.require(:article).permit(:title, :description, :user_id, :img)
	end

end
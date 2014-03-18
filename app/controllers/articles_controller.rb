class ArticlesController < ApplicationController

	before_filter do
		if !user_signed_in? then
			redirect_to new_user_session_path
		end
		@user = current_user
	end

	def create
		@article = Article.create(article_params)
		render "show"
	end

	def edit
		@article = Article.where(:id => params[:id])[0]
	end

	def show
		@article = Article.find_by(:id => params[:id])
	end

	def index
		@articles = Article.all.reverse
	end

	def new
	end

	def update
		@article = Article.find_by(id: params[:id])
		if !params[:img] then
			@article.img.destroy
		end
		@article.update(article_params)
		redirect_to articles_path
	end

	def destroy
		Article.find_by(id: params[:id]).destroy
		redirect_to articles_path
	end

private

	def article_params
		params.require(:article).permit(:description, :user_id, :img)
	end

end
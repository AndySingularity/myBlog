class ArticlesController < ApplicationController

	def create

	end

  def edit
    @article = Article.where(:id => params[:id])[0]
    if params[:article]
      @article.update(article_params)
    end 
  end

  def show
    @article = Article.where(:id => params[:id])[0]
  end

	def index
    @articles = Article.all.where(:user_id => current_user.id).reverse
	end

	def new
    if params[:article]
      @article = Article.new(article_params)
      @article.user_id = current_user.id
      @article.save
      redirect_to articles_path
    end
  end

  def article_params
    params.require(:article).permit(:title,:description)
  end

end

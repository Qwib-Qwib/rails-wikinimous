class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @new_article = Article.new
  end

  def create
    @new_article = Article.create(article_params)
    redirect_to article_path(@new_article)
  end

  def edit
    @edited_article = Article.find(params[:id])
  end

  def update
    @edited_article = Article.find(params[:id])
    @edited_article.update(article_params)
    redirect_to article_path(@edited_article)
  end

  def destroy
    @deleted_article = Article.find(params[:id])
    @deleted_article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end

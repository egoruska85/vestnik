class ArticlesController < ApplicationController
  def index
    @articles = Article.page(params[:page])
    #@posts = Post.page(params[:page])
  end
  def show
    @article = Article.find(params[:id])
  end
end

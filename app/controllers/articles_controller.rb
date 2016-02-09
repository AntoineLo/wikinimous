class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @user = User.find(@article.user_id).name
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(params_article)
    redirect_to article_path(@article)
  end

  def edit
  end

  def update
    @article.update(params_article)
    redirect_to article_path(@article)
  end

  def destroy
    @article.delete
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def params_article
    params.require(:article).permit(:title, :content, :user_id)
  end
end

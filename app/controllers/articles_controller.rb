class ArticlesController < ApplicationController
  before_action :set_article, only: %i[update show destroy edit]
  def index
  	@articles = Article.all
  end
  def create
      article = Article.create(article_params)
      redirect_to article_path(article)

  end
  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end
  def destroy
    @article.destroy()
    redirect_to articles_path
  end
  def show
    @number_of_article = params[:id]
    @text_of_article = params[:body]
  end
  def new
    @article= Article.new do
    end
  end
  def edit
  end

  private

  def article_params
    params.require(:article).permit(:body, :id, :title)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end

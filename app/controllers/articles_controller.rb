class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    if params[:query].present?
      @articles = @articles.where("title LIKE '%#{params[:query]}%'")
      # @articles = @articles.where(title: params[:query])
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to index_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to index_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end

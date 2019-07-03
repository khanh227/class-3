class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "thoai", password: "123456", except: [:index, :show]

	def index
    @articles = Article.all
  end
 
  def show
    article
  end
 
  def new
    @article = Article.new
  end
 
  def edit
    article
  end
 
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
 
  def update
    if article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
 
  def destroy
    article.destroy
    redirect_to articles_path
  end
 
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
  private
    def article
      @article = Article.find(params[:id])
    end
end

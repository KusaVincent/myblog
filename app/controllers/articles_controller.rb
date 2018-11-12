class ArticlesController < ApplicationController
 #http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
before_action :set_article, only: [:edit, :update, :show, :destroy]

 def index
  @articles = Article.all
   @articles = Article.paginate(page: params[:page], per_page: 3)
 end
 def new
  @article = Article.new
 end
 def create
  @article = Article.new(article_params)
  @article.user = User.first
  if @article.save
   flash[:notice] = "Article was successfully created"
   redirect_to article_path(@article)
  else
   render 'new'
  end
 end
 def show
  
 end
 def edit
  
 end

 def update
  if @article.update(article_params)
   flash[:notice] = "Article was updated"
   redirect_to article_path(@article)
  else
   flash[:notice] = "Article was not updated"
   render 'edit'
  end
  def destroy
   @article.destroy 
   flash[:notice] = "Article was deleted"
   redirect_to articles_path
  end
 end
 private
  def set_article
   @article = Article.find(params[:id])
  end
  def article_params
   params.require(:article).permit(:title, :description, :image, :video, :thumbnail, :file)
  end
end
class CommentsController < ApplicationController
	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(params[:comment].permit(:name, :body))
		redirect_to article_path(@article)
	end
	
	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comment.find(paramds[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end	
end

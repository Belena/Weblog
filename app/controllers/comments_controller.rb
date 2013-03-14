class CommentsController < ApplicationController
  
  # sets up nesting for comments. 
  # We use the create method on @article.comments to create and save the comment. 
  # This will automatically link the comment so that it belongs to that particular post.
  # Once we have made the new comment, 
  # we send the user back to the original post using the article_path(@article) helper
  
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(params[:comment])
    redirect_to article_path(@article)
  end
end

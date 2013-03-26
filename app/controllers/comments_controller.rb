class CommentsController < ApplicationController
  # to allow only authenticated user to delete comments

  #http_basic_authenticate_with :name => "ddh", :password => "secret", :only => "destroy"
 
  # sets up nesting for comments. 
  # We use the create method on @article.comments to create and save the comment. 
  # This will automatically link the comment so that it belongs to that particular post.
  # Once we have made the new comment, 
  # we send the user back to the original post using the article_path(@article) helper
  
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(params[:comment])
    @comment.user_id = current_user
    redirect_to article_path(@article)
    
  end

# The destroy action will find the post we are looking at, 
# locate the comment within the @post.comments collection, 
# and then remove it from the database and send us back to the show action for the post.
  
  def destroy
    @article = Article.find(params[:post_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@article)
  end
 
end

class VotedUsersController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @voted_user = VotedUser.where(:article_id => params[:article_id], :user_id => current_user).first_or_create

    @voted_user.rvalue = params[:voted_user][:rvalue]

    if @voted_user.article_id == nil
      @voted_user.article_id = params[:article_id]
    end

    if @voted_user.user_id == nil
      @voted_user.user_id = current_user
    end
    @voted_user.save
    
    # Find an article by article_id, save it to @article
    @article = Article.find(params[:article_id])
    # Calculate average rating for this article and save it to the @article.rating
    @article.rating = VotedUser.where(:article_id => @article.id).average("rvalue").round(1)
    @article.save

    redirect_to article_path(@article)  
  end

# The destroy action will find the post we are looking at, 
# locate the comment within the @post.comments collection, 
# and then remove it from the database and send us back to the show action for the post.
  
  def destroy
    @article = Article.find(params[:article_id])
    @voted_user = @article.voted_users.all
    @voted_user.destroy
    redirect_to article_path(@article)
  end
end

class SiteController < ApplicationController
  def about
  end

  def contact
  end

  def home
    @articles = Article.where(:published => true).order("created_at DESC").limit(6)
    respond_to do |format|
      format.html # home.html.erb
      format.json { render json: @articles }
    end
  end
end

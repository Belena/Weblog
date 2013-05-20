class ArticlesController < ApplicationController
  
  # to allow change or delete articles only after authentification
  # http_basic_authenticate_with :name => "dhh", :password => "secret", :except => [:index, :show]
before_filter :authenticate_user!, :except => [:show, :index]

  
 def search
  @search_term = params[:q]

  if @search_term.length < 3 or @search_term.length >= 30
    search_error = true
  else
    st = "%#{params[:q]}%"
    @articles = Article.where("Title like ? or Content like ?", st, st)
  end

  respond_to do |format|
    if search_error
      format.html { redirect_to home_path, notice: 'Please enter correct search term (alpha-numerical value at least 3 symbols long).' }
    else
      format.html # search.html.erb
    end
  end
end
  

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.where(:published => true).paginate :page => params[:page], :per_page => 3

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.where(:id => params[:id], :published => true).first

    respond_to do |format|
      if @article
        format.html # show.html.erb
        format.json { render json: @article }
      else
        format.html { redirect_to home_path, notice: 'Article has not been published yet.' }
      end
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])
    @article.author = current_user.username
    @article.published = true

    respond_to do |format|
      if @article.save
        format.html { redirect_to home_path, notice: "Article was successfully created " +
          "and will be published after admin's review." }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
        
        # another way:
        # if @article.save
        #   redirect_to articles_path, :notice => "Your article was created"
        # else
        #   render "new"
        # end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Your post has been deleted' }
      format.json { head :no_content }
    end
  end
end

  


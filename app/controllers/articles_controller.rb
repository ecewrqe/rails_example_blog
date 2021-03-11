require "json"
# rails generate controller Article index
# rails generate controller YourController actions

# @articles is this->articles

# resources
# GET / => articles#index 
# GET /articles => articles#index
# GET /articles/new => articles#new
# GET /articles/:id => articles#show
# POST /articles => articles#create
# GET /articles/:id/edit => articles#edit
# PATCH /articles/:id => articles#update
# DELETE /articles/:id => articles#destroy
class ArticlesController < ApplicationController
  # GET / => articles#index 
  # GET /articles => articles#index
  # layout "xxx" # layout/xxx.html.erb
  # layout false, template inheritance
  # redirect_to url, redirect_back

  # head xxx: xxx
  def index
    puts "==================", request.host
    puts "resource: index"
    @articles = Article.all
    # view: index.html.erb
    
    @books = []
    # { locale: I18n.locale }
    # session.delete()

    # Rails.application.config.session_store :cookie_store, key:, domain:
    # session[:xxx]
    # cookies[a]=b, cookies.delete(xxxx)
    # respond_to do |format|
    #   format.html, format.json{render json: @users}
    # end

    # send_file()
    cookies[:k1]="v1"
    # response.header["aa"] = "bb"

  end

  # GET /articles/:id => articles#show
  def show
    puts "resource: show"
    @article = Article.find(params[:id])
    # view: show.html.erb
  end

  # GET /articles/new => articles#new
  def new
    @article = Article.new
    # view: new.html.erb
  end

  # POST /articles => articles#create
  def create
    # puts "resource: create"
    title = params[:article][:title]
    body = params[:article][:body]
    status = params[:article][:status]
    # puts title, "====", body

    puts "article_params___", article_params
    # @article = Article.new(title: title, body: body, status: status)
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
      # redirect to show: /articles/:id
    else
      # valids failed
      # title present, and body present and minimum is 10
      render :new
      # render new.html.erb
    end
    
    chars = 'a,b,c'
    chars.split(',').length
    
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    puts article_params
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end

  end


  def destroy
      @article = Article.find(params[:id])
      @article.destroy
      redirect_to root_path
  end

  private
      def article_params
        params.require(:article).permit(:title, :body, :status)
      end


end

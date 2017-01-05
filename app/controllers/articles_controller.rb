class ArticlesController < ApplicationController

  def new
  	@article = Article.new
  end

  def create
  	@article = Article.new(params)
  	if @article.save
  		flash[:success] = 'Article successfully created'
  		redirect_to article_path(@article)
  	else
  		render 'edit'
  	end
  end

  def show
    @article = Article.find(params[:id])
    @comments = Comment.where(article_id: @article.id).order(created_at: :desc)
    @newComment = Comment.new
    @articleId = @article.id
    @articles = [@article]
    @hash = Gmaps4rails.build_markers(@articles) do |article, marker|
      article_link = view_context.link_to article.title, article_path(article)
      marker.lat article.latitude
      marker.lng article.longitude
      marker.title article.title
      marker.infowindow "<h4>#{article_link}</h4>
                        <small>"+article.created_at.strftime("%F")+"</small><br>
                        <i>#{article.description}</i>"
    end
  end
end

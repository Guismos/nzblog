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
  end
end

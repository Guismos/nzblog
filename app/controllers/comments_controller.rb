class CommentsController < ApplicationController

  def create
    @comment = Comment.new()

   	@comment.article_id = params[:comment][:article_id]
   	@comment.author = params[:comment][:author]
   	@comment.body = params[:comment][:body]

    respond_to do |format|
      if @comment.save
        format.js { render 'create.js.erb' }
        format.json { render :show, status: :created, location: @comment }
        format.html { redirect_to @comment.article, notice: 'Comment was successfully created.' }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.html { render :new }
      end
    end
  end

  def talktous
    @comments = Comment.where("article_id is null").order(created_at: :desc)
    @articleId = nil
  end

end

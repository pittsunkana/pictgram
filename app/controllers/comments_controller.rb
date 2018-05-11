class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(body: params[:comment][:body])
    @comment.topic_id = params[:comment][:topic_id]
    if @comment.save
      redirect_to topics_path, notice: 'コメントを投稿しました'
    else
      flash.now[:alert] = 'コメントに失敗しました'
      render :new
    end
  end
end

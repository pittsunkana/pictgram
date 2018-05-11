class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topics_params)
    if @topic.save
      redirect_to topics_path, notice: '投稿に成功しました'
    else
      flash[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def index
    @topics = Topic.all.includes(:favorite_users)
  end

  private
  def topics_params
    params.require(:topic).permit(:image, :description)
  end

end

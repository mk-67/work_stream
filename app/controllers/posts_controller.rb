class PostsController < ApplicationController
  def index
    @post_deadline = PostDeadline.new
    @channel = Channel.find(params[:channel_id])
    @posts = @channel.posts.includes(:user)
    @deadlines = Deadline.order("deadline ASC")
    @like = Like.new
    @holds = Hold.all
    @memos = Memo.order(id: "DESC")
  end

  def create
    @channel = Channel.find(params[:channel_id])
    @post_deadline = PostDeadline.new(post_deadline_params)
    #@post = @channel.posts.new(post_params)
    if @post_deadline.save
      redirect_to channel_posts_path(@channel)
    else
      @posts = @channel.posts.includes(:user)
      redirect_to channel_posts_path
      #render :index
    end
  end

  private

  def post_deadline_params
    params.require(:post_deadline).permit(:content, :deadline, :image).merge(user_id: current_user.id, channel_id: params[:channel_id])
  end
end

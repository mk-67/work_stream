class PostsController < ApplicationController
  def index
    @post = Post.new
    @channel = Channel.find(params[:channel_id])
    @posts = @channel.posts.includes(:user).order("deadline ASC")
    @like = Like.new
    @holds = Hold.all
    @memos = Memo.order(id: "DESC")
  end

  def create
    @channel = Channel.find(params[:channel_id])
    @post = @channel.posts.new(post_params)
    if @post.save
      redirect_to channel_posts_path(@channel)
    else
      @posts = @channel.posts.includes(:user)
      render :index
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :deadline, :image).merge(user_id: current_user.id)
  end
end

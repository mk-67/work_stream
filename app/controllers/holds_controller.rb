class HoldsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @holds = Hold.all
  end

  def create
    @post = Post.find(params[:post_id])
    @hold = Hold.new(hold_params)
    @hold.save
    redirect_to channel_posts_path
  end

  private
  def hold_params
    params.permit(:check_hold).merge(post_id: @post.id)
  end
end

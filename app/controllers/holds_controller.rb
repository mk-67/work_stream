class HoldsController < ApplicationController
  def index
    @channel = Channel.find(params[:channel_id])
    @post = Post.find(params[:post_id])
    @holds = Hold.all
  end

  def create
    @channel = Channel.find(params[:channel_id])
    @post = Post.find(params[:post_id])
    @hold = Hold.new(hold_params)
    @hold.save
    redirect_to channel_posts_path
  end

  def destroy
    @channel = Channel.find(params[:channel_id])
    @post = Post.find(params[:post_id])
    @hold = Hold.find_by(channel_id: @channel.id, post_id: @post.id)
    @hold.destroy
    redirect_to channel_posts_path
  end

  private
  def hold_params
    params.permit(:check_hold).merge(channel_id: @channel.id, post_id: @post.id)
  end
end

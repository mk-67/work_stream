class LikesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_like

    def create
      like = current_user.likes.new(channel_id: @channel.id, post_id: @post.id)
      like.save
      redirect_to channel_posts_path
    end

    def destroy
      @like = Like.find_by(user_id: current_user.id, channel_id: @channel.id, post_id: @post.id)
      @like.destroy
      redirect_to channel_posts_path
    end

    private
    def set_like
      @channel = Channel.find(params[:channel_id])
      @post = Post.find(params[:post_id])
    end

end

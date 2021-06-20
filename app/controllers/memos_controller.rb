class MemosController < ApplicationController
  def index
    @channel = Channel.find(params[:channel_id])
    @memos = Memo.all
  end

  #def new
    #@channel = Channel.find(params[:channel_id])
    #@memo = Memo.new
  #end

  def create
    @channel = Channel.find(params[:channel_id])
    @memo = Memo.new(memo_params)
    @memo.save
    redirect_to channel_posts_path(@channel)
  end

  private
  def memo_params
    params.require(:memo).permit(:memo).merge(channel_id: @channel.id)
  end
end

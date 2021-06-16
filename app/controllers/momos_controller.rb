class MomosController < ApplicationController
  def index
    @memos = Memo.order(id: "created_at DESC")
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    @memo.save
    redirect_to root_path
  end

  private
  def memo_params
    params.require(:memo).permit(:memo).merge(channel_id: channel.id)
  end
end

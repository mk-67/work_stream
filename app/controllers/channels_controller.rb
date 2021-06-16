class ChannelsController < ApplicationController
  def index
  end
  
  def new
    @channel = Channel.new
  end

  def create
    @channel = Channel.new(channel_params)
    if @channel.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    channel = Channel.find(params[:id])
    channel.destroy
    redirect_to root_path
  end

  def edit
    @channel = Channel.find(params[:id])
  end

  def update
    @channel = Channel.find(params[:id])
    if @channel.update(channel_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def channel_params
    params.require(:channel).permit(:channel, user_ids: [])
  end
end

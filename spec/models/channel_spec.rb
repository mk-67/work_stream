require 'rails_helper'

RSpec.describe Channel, type: :model do
  describe '#create' do
    before do
      @channel = FactoryBot.build(:channel)
    end

    it 'channelの値が存在すれば登録できること' do
      expect(@channel).to be_valid
    end

    it 'channelが空では登録できないこと' do
      @channel.channel = ''
      @channel.valid?
      expect(@channel.errors.full_messages).to include("Channel can't be blank")
    end
  end
end

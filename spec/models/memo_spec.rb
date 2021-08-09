require 'rails_helper'

RSpec.describe Memo, type: :model do
  describe '#create' do
    before do
      @memo = FactoryBot.build(:memo)
    end

    it 'channel_idとuser_idが存在していれば保存できること' do
      expect(@memo).to be_valid
    end

    it 'channelが紐付いていないと保存できないこと' do
      @memo.channel = nil
      @memo.valid?
      expect(@memo.errors.full_messages).to include('Channel must exist')
    end

    it 'userが紐付いていないと保存できないこと' do
      @memo.user = nil
      @memo.valid?
      expect(@memo.errors.full_messages).to include('User must exist')
    end
  end
end

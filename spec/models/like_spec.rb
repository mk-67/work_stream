require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#create' do
    before do
      @like = FactoryBot.build(:like)
    end

    it 'user_idとchannel_idとpost_idが存在していれば保存できること' do
      expect(@like).to be_valid
    end

    it 'userが紐付いていないと保存できないこと' do
      @like.user = nil
      @like.valid?
      expect(@like.errors.full_messages).to include('User must exist')
    end

    it 'channelが紐付いていないと保存できないこと' do
      @like.channel = nil
      @like.valid?
      expect(@like.errors.full_messages).to include('Channel must exist')
    end

    it 'postが紐付いていないと保存できないこと' do
      @like.post = nil
      @like.valid?
      expect(@like.errors.full_messages).to include('Post must exist')
    end
  end
end

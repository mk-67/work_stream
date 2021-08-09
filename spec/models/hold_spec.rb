require 'rails_helper'

RSpec.describe Hold, type: :model do
  describe '#create' do
    before do
      @hold = FactoryBot.build(:hold)
    end

    it 'channel_idとpost_idが存在していれば保存できること' do
      expect(@hold).to be_valid
    end

    it '重複したpost_idが存在する場合登録できない' do
      @hold.save
      another_hold = FactoryBot.build(:hold)
      another_hold.post = @hold.post
      another_hold.valid?
      expect(another_hold.errors.full_messages).to include('Post has already been taken')
    end

    it 'channelが紐付いていないと保存できないこと' do
      @hold.channel = nil
      @hold.valid?
      expect(@hold.errors.full_messages).to include('Channel must exist')
    end

    it 'postが紐付いていないと保存できないこと' do
      @hold.post = nil
      @hold.valid?
      expect(@hold.errors.full_messages).to include('Post must exist')
    end
  end
end

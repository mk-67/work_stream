require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#create' do
    before do
      @post = FactoryBot.build(:post)
    end

    it 'contentとimageが存在していれば保存できること' do
      expect(@post).to be_valid
    end

    it 'contentが空でも保存できること' do
      @post.content = ''
      expect(@post).to be_valid
    end

    it 'imageが空でも保存できること' do
      @post.image = nil
      expect(@post).to be_valid
    end

    it 'contentとimageが空では保存できないこと' do
      @post.content = ''
      @post.image = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("Content can't be blank")
    end

    it 'channelが紐付いていないと保存できないこと' do
      @post.channel = nil
      @post.valid?
      expect(@post.errors.full_messages).to include('Channel must exist')
    end

    it 'userが紐付いていないと保存できないこと' do
      @post.user = nil
      @post.valid?
      expect(@post.errors.full_messages).to include('User must exist')
    end
  end
end

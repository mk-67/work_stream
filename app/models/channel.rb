class Channel < ApplicationRecord
  has_many :channel_users, dependent: :destroy
  has_many :users, through: :channel_users
  has_many :posts, dependent: :destroy

  validates :channel, presence: true
end

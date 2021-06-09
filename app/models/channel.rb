class Channel < ApplicationRecord
  has_many :channel_users
  has_many :users, through: :channel_users

  validates :channel, presence: true
end

class Hold < ApplicationRecord
  belongs_to :channel
  belongs_to :post

  validates :post, uniqueness: true
end

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :channel
  has_one_attached :image
  has_many :likes
  has_many :users, through: :likes

  validates :content, presence: true, unless: :was_attached?

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def was_attached?
    self.image.attached?
  end
end

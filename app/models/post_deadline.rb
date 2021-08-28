class PostDeadline
  include ActiveModel::Model
  attr_accessor :content, :image, :user_id, :channel_id, :deadline

  def save
    post = Post.create(content: content, image: image, user_id: user_id, channel_id: channel_id)
    Deadline.create(deadline: deadline, post_id: post.id)
  end

end
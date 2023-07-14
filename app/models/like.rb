class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :likes_counter

  def update_post_like_counter
    post.update(likes_counter: post.likes.count)
  end
end

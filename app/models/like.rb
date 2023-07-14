class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, counter_cache: :likes_counter

  after_save :update_post_like_counter

  private

  def update_post_like_counter
    post.update(likes_counter: post.likes.count)
  end
end

class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, counter_cache: :comments_counter

  after_save :update_post_counter

  private
  
  def update_post_counter
    post.update(comments_counter: post.comments.count)
  end
end

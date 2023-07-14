class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: :posts_counter
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_save :update_posts_count

  def recent_comments
    comments.last(5)
  end

  private

  def update_posts_count
    author.update(posts_counter: author.posts.count)
  end
end

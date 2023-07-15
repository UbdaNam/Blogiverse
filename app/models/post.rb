class Post < ApplicationRecord
  after_initialize :set_defaults
  belongs_to :author, class_name: 'User', counter_cache: :posts_counter
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  after_save :update_posts_count

  def set_defaults
    self.comments_counter = 0
    self.likes_counter = 0
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_count
    author.update(posts_counter: author.posts.count)
  end
end

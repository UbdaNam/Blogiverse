class User < ApplicationRecord
  after_initialize :set_defaults
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def set_defaults
    self.posts_counter = 0
  end

  def recent_three
    posts.order(created_at: :desc).limit(3)
  end
end

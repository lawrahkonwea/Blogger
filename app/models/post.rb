class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  after_save :update_posts_count
  after_destroy :decrement_posts_count

  validates :title, presence: true, length: { maximum: 250 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_posts_count
    author.increment!(:post_counter)
  end

  def decrement_posts_count
    author.decrement!(:post_counter)
  end

  def recent_five_comments
    comments.last(5)
  end
end

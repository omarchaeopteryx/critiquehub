class Review < ActiveRecord::Base
  belongs_to :user, foreign_key: :reviewer
  has_many :comments

  validates :reviewer_id, :movie_id, :score, :title, :content, :conclusion, presence: true
  validates :reviewer_id, uniqueness: { scope: :movie_id, message: "You can only review once" }
  validates :score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end

class Review < ActiveRecord::Base
  belongs_to :user, foreign_key: 'reviewer_id'
  has_many :comments

  validates :reviewer_id, :movie_id, :score, :title, :content, :conclusion, presence: true
  validates_uniqueness_of :reviewer_id, { :scope => :movie_id }
  validates :score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validate :reviewer_validation

  def reviewer_validation
    return if user.nil?
    if self.user.type_of_user != 0
      errors.add :user, "is not a valid reviewer"
    end
  end
end

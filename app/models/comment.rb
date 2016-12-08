class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :review_id, :user_id, :description, presnece: true
  validates :description, length: { minimum: 5, maximum: 100}
end

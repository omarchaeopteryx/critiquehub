require 'rails_helper'

describe Review do
  subject { Review.new(reviewer_id: 1,
                           movie_id: 1,
                           score: 5,
                           title: "Batman Movie review",
                           content: "it's a good movie",
                           conclusion: "overall, thumbs up"
                           ) }
  it do
    should belong_to(:user).
      with_foreign_key('reviewer_id')
  end

  it { should have_many(:comments) }
  it { should validate_presence_of(:reviewer_id) }
  it { should validate_presence_of(:movie_id) }
  it { should validate_presence_of(:score) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:conclusion) }

  it do
    should validate_uniqueness_of(:reviewer_id).
    scoped_to(:movie_id)
  end

  it { should validate_numericality_of(:score).only_integer }

  it do
    should validate_numericality_of(:score).
      is_less_than_or_equal_to(5)
  end

  it do
    should validate_numericality_of(:score).
      is_greater_than_or_equal_to(0)
  end
end

require 'rails_helper'

describe Comment do
  it { should belong_to(:user) }
  it { should belong_to(:review) }
  it { should validate_presence_of(:review_id) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:user) }

  it do
    should validate_length_of(:description).
      is_at_least(5).
      on(:create)
  end

  it do
    should validate_length_of(:description).
      is_at_most(100).
      on(:create)
  end
end

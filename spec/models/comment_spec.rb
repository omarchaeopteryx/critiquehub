require 'rails_helper'

describe Comment do
  let!(:user) { User.create(username: "benjamin",
                           password_digest: "1234",
                           email: "benjamin@gmail.com"
                           ) }
  let!(:comment) { user.comments.create(review_id: 1,
                           description: "Yeah I agree"
                           ) }

  it "has a review id" do
    expect(comment.review_id).to eq 1
  end

  it "has a user" do
    u = User.find_by(username: "benjamin")
    test_id = u.id
    expect(comment.user_id).to eq test_id
  end

  it "has a user that is in our database" do
    expect(comment.user).not_to be nil
  end

  it "has a description" do
    expect(comment.description).to eq "Yeah I agree"
  end

  it "has a description with length that has minimum char of 5" do
    comment.description = "b"
    expect(comment.save).to be false
  end

  it "has a description with length that has maximum char of 100" do
    string = ""
    101.times { string << ("a".."z").to_a[rand(24)]}
    comment.description = string
    expect(comment.save).to be false
  end
end

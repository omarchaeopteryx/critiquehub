require 'rails_helper'

describe Review do
  let!(:review) { Review.create(reviewer_id: 1,
                           movie_id: 1,
                           score: 5,
                           title: "Batman Movie review",
                           content: "it's a good movie",
                           conclusion: "overall, thumbs up"
                           ) }

  it "has a reviewer" do
    expect(review.reviewer_id).to eq 1
  end

  it "has a movie id" do
    expect(review.movie_id).to eq 1
  end

  it "has a score" do
    expect(review.score).to eq 5
  end

  it "has a title" do
    expect(review.title).to eq "Batman Movie review"
  end

  it "has content" do
    expect(review.content).to eq "it's a good movie"
  end

  it "has a conclusion" do
    expect(review.conclusion).to eq "overall, thumbs up"
  end

  it "user can only review movie once" do
    review2 = Review.create(reviewer_id: 1,
                             movie_id: 1,
                             score: 2,
                             title: "Another Batman Movie review",
                             content: "this movie sucks",
                             conclusion: "overall, thumbs down"
                             )
    expect(review2.valid?).to be false
  end

  it "review score is an integer" do
    review.score = 2.5
    expect(review.save).to be false
  end

  it "review score is a number greater than or equal to 0" do
    review.score = -1
    expect(review.save).to be false
  end

  it "review score is a number less than or equal to 5" do
    review.score = 6
    expect(review.save).to be false
  end

end

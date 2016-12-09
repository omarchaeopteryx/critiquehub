require 'rails_helper'

describe User do
  subject { User.new(username: "BENJAMIN",
                     password_digest: "1234",
                     email: "BENJAMIN@gmail.com",
                     type_of_user: 0
                     ) }

  it { should have_many(:reviews) }
  it { should have_many(:comments) }
  it { should have_secure_password }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }

  it do
    should validate_length_of(:username).
      is_at_least(3).
      on(:create)
  end

  it do
    should validate_length_of(:username).
      is_at_most(25).
      on(:create)
  end

  it { should validate_uniqueness_of(:username).case_insensitive }
  it { should validate_uniqueness_of(:email).case_insensitive }

  it do
    should validate_length_of(:email).
      is_at_most(250).
      on(:create)
  end

  it "validates format of email" do
    subject.email = "test"
    expect(subject.save).to be false
  end
end

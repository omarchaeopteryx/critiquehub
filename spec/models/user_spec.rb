require 'rails_helper'

describe User do
  let!(:user) { User.create(username: "benjamin",
                           password_digest: "1234",
                           email: "benjamin@gmail.com"
                           ) }

  it "has a username" do
    expect(user.username).to eq "benjamin"
  end

  it "has a password_digest" do
    expect(user.password_digest).to eq "1234"
  end

  it "has a email" do
    expect(user.email).to eq "benjamin@gmail.com"
  end

  it "has a username with length that has minimum char of 3" do
    user.username = "b"
    expect(user.save).to be false
  end

  it "has a username with length that has maximum char of 25" do
    user.username = "whjjogujagmxtacxiaxcangnpn"
    expect(user.save).to be false
  end

  it "has a username without case snesitive" do
    user2 = User.new(username: "BENJAMIN",
                       password_digest: "1234",
                       email: "benjamin@gmail.com"
                      )
    expect(user2.valid?).to be false
  end

  it "has an email with length that has maximum char of 250" do
    string = ""
    251.times { string << ("a".."z").to_a[rand(24)]}
    user.email = string + "@gmail.com"
    expect(user.save).to be false
  end

  it "has a username without case snesitive" do
    user2 = User.new(username: "benjamin",
                       password_digest: "1234",
                       email: "BENJAMIN@gmail.com"
                      )
    expect(user2.valid?).to be false
  end

end

require 'rails_helper'

describe ApplicationHelper do
  describe "gravatar" do
    it "returns gravatar for user" do
      user = User.new(username: "BENJAMIN",password_digest: "1234",email: "BENJAMIN@gmail.com")

      expect(helper.gravatar_for(user)).to match(/\w*retro\b/)
    end
  end
end



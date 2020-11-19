require 'rails_helper'

RSpec.describe User, type: :model do
   describe "Users can register" do
    it "checks that a user can registered" do
      User.new(username: "example", email: "example@example.com", password: "123456", password_confirmation: "123456")
      expect(User.find_by(username: "example")).to be
    end
  end
end
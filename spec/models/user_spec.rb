require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "email need to @" do
      user = build(:user, email: "asdasdasd")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    it "email is only one" do
      user = build(:user)
      user_2 = build(:user)
      user_2.valid?
      expect(user.errors[:email]).to include()
    end

  end
end
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
      expect(user_2.errors[:email]).to include()
    end

    it "パスワードは6文字以上である事" do
      user = build(:user, password: "12qw", password_confirmation: "12qw")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

    it "パスワードは半角英数字混合である事" do
      user = build(:user, password: "123456", password_confirmation: "123456")
      user.valid?
      expect(user.errors[:password]).to include("need 1~9&a~z")
    end

    it "パスワードは確認用m含め2回記述する事" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

  end
end
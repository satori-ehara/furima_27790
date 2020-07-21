require 'rails_helper'
describe User do
  describe '#create' do
    it 'is invalid without a nickname' do
      user = build(:user, nickname: '')
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it 'is invalid without a email' do
      user = build(:user, email: '')
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without a password' do
      user = build(:user, password: '')
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'email need to @' do
      user = build(:user, email: 'asdasdasd')
      user.valid?
      expect(user.errors[:email]).to include('is invalid')
    end

    it 'email is only one' do
      user = build(:user)
      user_2 = build(:user)
      user_2.valid?
      expect(user_2.errors[:email]).to include
    end

    it 'パスワードは6文字以上である事' do
      user = build(:user, password: '12qw', password_confirmation: '12qw')
      user.valid?
      expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end

    it 'パスワードは半角英数字混合である事' do
      user = build(:user, password: '123456', password_confirmation: '123456')
      user.valid?
      expect(user.errors[:password]).to include('need 1~9&a~z')
    end

    it 'パスワードは確認用m含め2回記述する事' do
      user = build(:user, password_confirmation: '')
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it '名前を入力していないと登録できない事' do
      user = build(:user, first_name_kanji: '')
      user.valid?
      expect(user.errors[:first_name_kanji]).to include("can't be blank")
    end

    it '苗字を入力していないと登録できない事' do
      user = build(:user, last_name_kanji: '')
      user.valid?
      expect(user.errors[:last_name_kanji]).to include("can't be blank")
    end

    it '名前（読み）を入力していないと登録できない事' do
      user = build(:user, first_name_katakana: '')
      user.valid?
      expect(user.errors[:first_name_katakana]).to include("can't be blank")
    end

    it '苗字(読み)を入力していないと登録できない事' do
      user = build(:user, last_name_katakana: '')
      user.valid?
      expect(user.errors[:last_name_katakana]).to include("can't be blank")
    end

    it '名前は平仮名、片仮名、漢字いずれかで入力する必要がある事' do
      user = build(:user, first_name_kanji: 'aaa')
      user.valid?
      expect(user.errors[:first_name_kanji]).to include('is invalid')
    end

    it '苗字は平仮名、片仮名、漢字いずれかで入力する必要がある事' do
      user = build(:user, last_name_kanji: 'zzz')
      user.valid?
      expect(user.errors[:last_name_kanji]).to include('is invalid')
    end

    it '名前（読み）はカタカナで入力する必要がある事' do
      user = build(:user, first_name_katakana: 'ああ')
      user.valid?
      expect(user.errors[:first_name_katakana]).to include('is invalid')
    end

    it '苗字(読み)はカタカナで入力する必要がある事' do
      user = build(:user, last_name_katakana: 'いい')
      user.valid?
      expect(user.errors[:last_name_katakana]).to include('is invalid')
    end

    it '生年月日の年が入力されている事' do
      user = build(:user, Birthday_year: '0')
      user.valid?
      expect(user.errors[:Birthday_year]).to include('is invalid')
    end

    it '生年月日の月が入力されている事' do
      user = build(:user, Birthday_month: '0')
      user.valid?
      expect(user.errors[:Birthday_month]).to include('is invalid')
    end

    it '生年月日の日が入力されている事' do
      user = build(:user, Birthday_day: '0')
      user.valid?
      expect(user.errors[:Birthday_day]).to include('is invalid')
    end
  end
end

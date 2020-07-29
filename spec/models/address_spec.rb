require 'rails_helper'
describe Address do
  describe '#create' do
    before do
      @address = build(:address)
    end

    it '全て登録すればしっかりと保存できる事を確認' do
      expect(@address).to be_valid
    end

    it "郵便番号が無いと登録できない事をテスト" do
      @address.post_code = ""
      @address.valid?
      expect(@address.errors[:post_code]).to include("can't be blank")
    end

    it "都道府県が無いと登録できない事をテスト" do
      @address.prefecture_id = ""
      @address.valid?
      expect(@address.errors[:prefecture_id]).to include("can't be blank")
    end

    it "市区町村が無いと登録できない事をテスト" do
      @address.city = ""
      @address.valid?
      expect(@address.errors[:city]).to include("can't be blank")
    end

    it "番地が無いと登録できない事をテスト" do
      @address.address = ""
      @address.valid?
      expect(@address.errors[:address]).to include("can't be blank")
    end

    it "電話番号が無いと登録できない事をテスト" do
      @address.phone_number = ""
      @address.valid?
      expect(@address.errors[:phone_number]).to include("can't be blank")
    end

    it "電話番号が12桁だと登録できない事をテスト" do
      @address.phone_number = "111111111111"
      @address.valid?
      expect(@address.errors[:phone_number]).to include("is invalid")
    end

    it "電話番号が11桁で登録できる事をテスト" do
      @address.phone_number = "01111111111"
      expect(@address).to be_valid
    end


  end
end
require 'rails_helper'
describe Item do
  describe '#create' do
    before do
      @item = build(:item)
      @item2 = build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it '全て登録すればしっかりと保存できる事を確認' do
      expect(@item).to be_valid
    end


    it '画像を登録しなかった場合に保存できない事を確認' do
      @item2.valid?
      expect(@item2.errors[:image]).to include("can't be blank")
    end

    it '300円以下だと登録できない事を確認' do
      @item.price = 200
      @item.valid?
      expect(@item.errors[:price]).to include("must be greater than 299")
    end

    it '1000万円以上だと登録できない事を確認' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors[:price]).to include("must be less than 10000000")
    end

    it '数値じゃないと登録できない事を確認' do
      @item.price = "５６７８９"
      @item.valid?
      expect(@item.errors[:price]).to include("is not a number")
    end

    it '小数だと登録できない事を確認' do
      @item.price = 5000.5
      @item.valid?
      expect(@item.errors[:price]).to include("must be an integer")
    end

    it '商品名が無いと登録できない事を確認' do
      @item.name = ""
      @item.valid?
      expect(@item.errors[:name]).to include("can't be blank")
    end

    it '説明文が無いと登録できない事を確認' do
      @item.description = ""
      @item.valid?
      expect(@item.errors[:description]).to include("can't be blank")
    end

    it '値段が無いと登録できない事を確認' do
      @item.price = ""
      @item.valid?
      expect(@item.errors[:price]).to include("can't be blank")
    end

  end
end
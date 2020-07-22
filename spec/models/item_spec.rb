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

    it '画像を登録しなかった場合に保存できない事を確認' do
      
      @item.valid?
      expect(@item2.errors[:image]).to include("can't be blank")
    end
  end
end
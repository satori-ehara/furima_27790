require 'rails_helper'
describe Item do
  describe '#create' do
    before do
      @item = build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end


    it '保存できる' do
      expect(@item).to be_valid
    end
  end
end
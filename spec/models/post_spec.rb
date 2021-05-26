require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '体重の投稿' do
    context '投稿できる場合' do
      it "全ての値が存在すれば登録できる" do
        expect(@post).to be_valid
      end
      it "imageが存在しなくても登録できる" do
        @post.image = nil
        expect(@post).to be_valid
      end
    end

    context '投稿できない場合' do
      it "textが空の場合登録できない" do
        @post.text = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Text can't be blank")
      end
      it "weightが空の場合登録できない" do
        @post.weight = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Weight can't be blank")
      end
      it "textが71文字以上の場合登録できない" do
        @post.text = "a" * 80
        @post.valid?
        expect(@post.errors.full_messages).to include("Text is too long (maximum is 70 characters)")
      end
      it "weightが56kg以上の場合登録できない" do
        @post.weight = '56'
        @post.valid?
        expect(@post.errors.full_messages).to include("Weight must be less than or equal to 55")
      end
      it "weightが半角数字のみでないと登録できない" do
        @post.weight = '数字'
        @post.valid?
        expect(@post.errors.full_messages).to include("Weight is not a number")
      end
    end
  end
end

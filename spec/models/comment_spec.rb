require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe '投稿へのコメント' do
    context 'コメントできる場合' do
      it "comment_textが存在すれば登録できる" do
        expect(@comment).to be_valid
      end
    end

    context 'コメントできない場合' do
      it "comment_textが空だと登録できない" do
        @comment.comment_text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Comment text can't be blank")
      end
      it "comment_textが70文字以上だと登録できない" do
        @comment.comment_text = "a" * 80
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Comment text is too long (maximum is 70 characters)")
      end
    end
  end
end

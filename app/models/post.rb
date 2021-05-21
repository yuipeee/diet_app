class Post < ApplicationRecord
  with_options presence: true do
  validates :text
  validates :weight, numericality: { less_than_or_equal_to: 150 },format: { with:/\A[0-9]+\Z/ }
  end
  
  belongs_to :user
  has_many :comments
  has_one_attached :image
  has_many :likes

  def self.search(search)
    if search != ""
      Post.where('text LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end

end

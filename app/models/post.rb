class Post < ApplicationRecord
  with_options presence: true do
  validates :text,   length: { maximum: 70 }
  validates :weight, numericality: { less_than_or_equal_to: 55 }, format: { with:/\A[0-9]+\Z/ }
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

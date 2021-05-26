class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments
  has_many :likes

  with_options presence: true do
    validates :name,                  length: { maximum: 6 }
    validates :email    
    validates :password,              format: { with:/\A[0-9a-zA-Z]*$\z/ }
    validates :password_confirmation, format: { with:/\A[0-9a-zA-Z]*$\z/ }
  end

  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end
  
end

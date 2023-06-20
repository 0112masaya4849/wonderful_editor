class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :article_likes, dependent: :destroy
  validates :title, presence: true
end

class Book < ApplicationRecord
  belongs_to :user
  
  # バリデーション
  validates :title, presence: true
  validates :body, presence: true
end

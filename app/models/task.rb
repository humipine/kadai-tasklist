class Task < ApplicationRecord
  validates :content, presence: true, length: { maximum: 255 }
  
  # statusカラムの追加によるバリデーションの追加
  validates :status, presence: true, length: { maximum: 10 }
  
end

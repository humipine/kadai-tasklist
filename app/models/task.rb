class Task < ApplicationRecord
  # user:Task = 1:多（主従）の関係
  belongs_to :user
  
  # user_idを必須入力にして、userとのヒモ付なしでは保存できないようにする。
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  # statusカラムの追加によるバリデーションの追加
  validates :status, presence: true, length: { maximum: 10 }
  
end

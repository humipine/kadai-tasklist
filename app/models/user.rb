class User < ApplicationRecord
  # 保存前に、emailの文字列を大文字から小文字に自動変換する
  before_save { self.email.downcase! }
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :age, presence: false, length: { maximum: 3 }
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: { case_sensitive: false }
  
  # パスワード用のRailsの標準機能
  has_secure_password
  
end

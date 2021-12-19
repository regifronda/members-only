class User < ApplicationRecord
  has_many :posts
  validates :username, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..20 }
end

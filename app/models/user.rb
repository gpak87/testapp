class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :surname, presence: true
  validates :nickname, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/ }, length: { maximum: 255 }

  has_many :comments
  has_many :posts
  has_one :fleet
end

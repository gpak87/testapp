class Comment < ApplicationRecord
  validates :comment, presence: true
  validates :nick, presence: true

  belongs_to :post
  belongs_to :user
end

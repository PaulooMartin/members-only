class Post < ApplicationRecord
  validates :title, presence: true, length: {maximum: 52}
  validates :body, presence: true, length: {maximum: 180}

  belongs_to :user
end

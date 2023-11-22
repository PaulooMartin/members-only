class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :recoverable and :omniauthable
  devise :database_authenticatable, :registerable,
  :rememberable, :validatable

  validates :username, uniqueness: {case_sensitive: false }, presence: true,
                      length: { minimum: 3 }, format: { without: /\W/,
                      message: "can only have letters, numbers, and underlines" }
  has_many :posts

end

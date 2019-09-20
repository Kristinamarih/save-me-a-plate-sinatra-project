class User < ActiveRecord::Base
  validates :email, presence: true
  validates :password, presence: true

  has_secure_password
  has_many :meals
end

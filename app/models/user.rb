class User < ActiveRecord::Base
  has_secure_password
  has_many :meals

  def is_restaurant?
    !!@user.restaurant == true
  end
end

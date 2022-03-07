class User < ApplicationRecord

  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :sessions
end

class User < ActiveRecord::Base

  has_secure_password

  has_many :shoes, inverse_of: 'seller', foreign_key: 'seller_id'
  has_many :purchases, class_name: "Shoe", inverse_of: 'buyer', foreign_key: 'buyer_id'

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :email, :password, presence: true
  validates :email, presence: true, format: {with: EMAIL_REGEX}, uniqueness: {case_sensitive:false}

end

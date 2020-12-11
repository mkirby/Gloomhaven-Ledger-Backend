class User < ApplicationRecord
  has_many :user_campaigns
  has_many :campaigns, through: :user_campaigns
  has_many :characters
  has_many :parties, through: :characters
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }
end

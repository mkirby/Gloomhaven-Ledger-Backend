class Campaign < ApplicationRecord
  has_many :user_campaigns
  has_many :users, through: :user_campaigns
end

class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar, :parties
  has_many :campaigns, through: :user_campaigns
  has_many :characters
  has_many :parties, through: :characters
end

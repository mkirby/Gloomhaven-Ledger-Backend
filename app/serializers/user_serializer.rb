class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar
  has_many :user_campaigns
  has_many :campaigns, through: :user_campaigns
end

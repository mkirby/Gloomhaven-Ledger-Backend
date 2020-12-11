class CampaignSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :parties
  has_many :characters, through: :parties
end

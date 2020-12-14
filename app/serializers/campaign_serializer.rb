class CampaignSerializer < ActiveModel::Serializer
  attributes :id, :name, :parties, :characters, :created_at
  has_many :parties
  has_many :characters, through: :parties
end

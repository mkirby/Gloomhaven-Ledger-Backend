class PartySerializer < ActiveModel::Serializer
  attributes :id, :name, :notes, :reputation, :campaign, :characters
  belongs_to :campaign
  has_many :characters
end

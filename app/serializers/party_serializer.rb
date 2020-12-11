class PartySerializer < ActiveModel::Serializer
  attributes :id, :name, :notes, :reputation
  belongs_to :campaign
  has_many :characters
end

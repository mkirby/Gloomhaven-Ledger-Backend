class PartySerializer < ActiveModel::Serializer
  attributes :id, :name, :notes, :reputation, :campaign_id
  belongs_to :campaign
end

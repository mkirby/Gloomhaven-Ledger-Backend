class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :level, :experience, :gold, :checkmarks, :active, :retired, :party, :campaign
  belongs_to :party
  belongs_to :user
  
  def campaign
    object.party.campaign
  end
end

class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :level, :experience, :gold, :checkmarks, :active, :retired, :character_class, :party, :campaign
  belongs_to :party
  belongs_to :user
  belongs_to :character_class
  
  def campaign
    object.party.campaign
  end
end

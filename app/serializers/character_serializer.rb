class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :level, :experience, :gold, :checkmarks, :active, :retired
  belongs_to :party
  belongs_to :user
end

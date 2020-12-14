class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :level, :experience, :gold, :checkmarks, :active, :retired, :party
  belongs_to :party
  belongs_to :user
end

class CharacterClassSerializer < ActiveModel::Serializer
  attributes :fullname, :name, :name_hidden, :abbreviation, :max_ability_cards, :events_on_unlock, :events_on_retirement, :img_mat_front, :img_mat_back, :img_portrait, :img_icon, :health, :description
end

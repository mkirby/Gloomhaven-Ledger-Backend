class Character < ApplicationRecord
  belongs_to :user
  belongs_to :party
  belongs_to :character_class
end

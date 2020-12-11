class Party < ApplicationRecord
  belongs_to :campaign
  has_many :characters
  has_many :users, through: :characters
end

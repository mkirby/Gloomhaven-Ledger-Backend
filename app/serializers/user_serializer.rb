class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar, :parties
  has_many :user_campaigns
  has_many :campaigns, through: :user_campaigns
  has_many :characters
  has_many :parties, through: :characters

  # def parties
  #   user_parties = []
  #   user = User.find(object.id)
  #   unique_user_parties = user.parties.uniq
  #   unique_user_parties.each { |party| user_parties.push(PartySerializer.new(party))}
  #   user_parties
  # end
end

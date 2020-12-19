class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar, :parties
  has_many :campaigns, through: :user_campaigns
  has_many :characters
  # has_many :parties, through: :characters

  def parties
    parties = []
    user = User.find(object.id)
    campaigns = user.campaigns
    campaigns.each do |campaign|
      campaign.parties.each do |party|
        parties.push(PartySerializer.new(party))
      end
    end
    parties
  end

end

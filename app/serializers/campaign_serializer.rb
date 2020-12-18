class CampaignSerializer < ActiveModel::Serializer
  attributes :id, :name, :parties, :characters, :players, :owner, :created_at
  has_many :parties
  has_many :characters, through: :parties

  def players
    users = []
    object.users.each { |user| users.push({id: user.id, username: user.username, avatar: user.avatar })}
    users
  end

  def owner
    user_campaign_owner = object.user_campaigns.find { |uc| uc.owner}
    owner = User.find_by(id: user_campaign_owner.user_id)
    ownerHash = {
      id: owner.id,
      username: owner.username,
      avatar: owner.avatar
    }
  end
end

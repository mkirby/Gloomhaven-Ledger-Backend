class CampaignSerializer < ActiveModel::Serializer
  attributes :id, :name, :parties, :characters, :players, :created_at
  has_many :parties
  has_many :characters, through: :parties

  def players
    users = []
    object.users.each { |user| users.push({id: user.id, username: user.username, avatar: user.avatar })}
    users
  end
end

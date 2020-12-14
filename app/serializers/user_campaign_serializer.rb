class UserCampaignSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :campaign, :owner

  def campaign
    CampaignSerializer.new(object.campaign)
  end

end

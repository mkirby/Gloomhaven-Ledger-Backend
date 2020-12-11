class UserCampaignSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :campaign_id, :campaign_name, :owner

  def campaign_name
    object.campaign.name
  end
end

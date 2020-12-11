class Api::V1::CampaignsController < ApplicationController

  def create
    campaign = Campaign.create(campaign_params)
    if campaign.valid?
      # create the user camapaign here and set true for owner
      user_campaign = UserCampaign.create(user_id: current_user.id, campaign_id: campaign.id, owner: true)
      render json: { campaign: CampaignSerializer.new(campaign)}, status: :created
    else
      render json: { error: 'failed to create campaign' }, status: :not_acceptable
    end
  end

  private

  def campaign_params
    params.require(:campaign).permit(:name)
  end
end

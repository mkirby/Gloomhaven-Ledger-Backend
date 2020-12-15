class Api::V1::CampaignsController < ApplicationController
  before_action :find_campaign, only: [:show,:update, :destroy]

  def index
    # FIXME dont like how this is returning without hitting the serializer but haven't quite figured it out yet
    campaigns = []
    current_user.campaigns.each{ |i| campaigns.push(i)}
    render json: { campaigns: campaigns}, status: :created
  end

  def show
    if @campaign.valid?
      render json: { campaign: CampaignSerializer.new(@campaign)}, status: :ok
    else
      render json: { error: 'campaign not found'}, status: :not_found
    end
  end

  def create
    campaign = Campaign.create(campaign_params)
    if campaign.valid?
      user_campaign = UserCampaign.create(user_id: current_user.id, campaign_id: campaign.id, owner: true)
      if user_campaign.valid?
        render json: { campaign: CampaignSerializer.new(campaign)}, status: :created
      else
        render json: { error: 'failed to link user to a campaign' }, status: :not_acceptable
      end
    else
      render json: { error: 'failed to create campaign' }, status: :not_acceptable
    end
  end

  def update
    @campaign.update(campaign_params)
    render json: { campaign: CampaignSerializer.new(@campaign) }, status: :ok
  end

  def destroy
    # TODO gonna need to decide how much to delete when a campaign is deleted
    @campaign.delete
    render json: {}, status: :accepted
  end

  private
  
  def find_campaign
    @campaign = Campaign.find(params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(:name)
  end
end

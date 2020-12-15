class Api::V1::PartiesController < ApplicationController
  before_action :find_party, only: [:show, :update]

  def show
    if @party.valid?
      render json: { party: PartySerializer.new(@party)}, status: :ok
    else
      render json: { error: 'party not found'}, status: :not_found
    end
  end

  def create
    party = Party.create(party_params)
    if party.valid?
      render json: { party: PartySerializer.new(party) }, status: :created
    else
      render json: { error: 'failed to create party' }, status: :not_acceptable
    end
  end

  def update
    @party.update(party_params)
    render json: { party: PartySerializer.new(@party) }, status: :ok
  end

  def destroy
    # TODO gonna need to decide how much to delete when a party is deleted
    @party.delete
    render json: {}, status: :accepted
  end

  private

  def find_party
    @party = Party.find(params[:id])
  end

  def party_params
    params.require(:party).permit(:name, :notes, :reputation, :campaign_id)
  end
end

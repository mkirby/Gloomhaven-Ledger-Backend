class Api::V1::PartiesController < ApplicationController
  before_action :find_party, only: [:show, :update, :destroy]

  def show
    if @party.valid?
      render json: { party: PartySerializer.new(@party), user: UserSerializer.new(current_user)}, status: :ok
    else
      render json: { error: 'party not found'}, status: :not_found
    end
  end

  def create
    party = Party.create(party_params)
    if party.valid?
      render json: { party: PartySerializer.new(party), user: UserSerializer.new(current_user) }, status: :created
    else
      render json: { error: 'failed to create party' }, status: :not_acceptable
    end
  end

  def update
    @party.update(party_params)
    render json: { party: PartySerializer.new(@party), user: UserSerializer.new(current_user) }, status: :ok
  end

  def destroy
    @party.characters.each { |character| character.delete}
    @party.delete
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  private

  def find_party
    @party = Party.find(params[:id])
  end

  def party_params
    params.require(:party).permit(:name, :notes, :reputation, :campaign_id)
  end
end

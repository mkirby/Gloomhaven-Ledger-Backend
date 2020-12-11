class Api::V1::CharactersController < ApplicationController
  before_action :find_character, only: [:update]
  
  def create
    character = Character.create(character_params)
    if character.valid?
      render json: { character: CharacterSerializer.new(character) }, status: :created
    else
      render json: { error: 'failed to create character' }, status: :not_acceptable
    end
  end

  def update
    @character.update(character_params)
    render json: { character: CharacterSerializer.new(@character) }, status: :ok
  end

  def destroy
    # TODO gonna need to decide how much to delete when a character is deleted
    @character.delete
    render json: {}, status: :accepted
  end

  private

  def find_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:user_id, :party_id, :name, :level, :experience, :gold, :checkmarks, :active, :retired)
  end

end

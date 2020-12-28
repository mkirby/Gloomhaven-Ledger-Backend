class Api::V1::CharactersController < ApplicationController
  before_action :find_character, only: [:show, :update, :destroy]
  
  def show
    if @character.valid?
      render json: { character: CharacterSerializer.new(@character), user: UserSerializer.new(current_user) }, status: :ok
    else
      render json: { error: 'character not found'}, status: :not_found
    end
  end

  def create
    character = Character.create(character_params)
    if character.valid?
      render json: { character: CharacterSerializer.new(character), user: UserSerializer.new(current_user) }, status: :created
    else
      render json: { error: 'failed to create character' }, status: :not_acceptable
    end
  end

  def update
    @character.update(character_params)
    render json: { character: CharacterSerializer.new(@character), user: UserSerializer.new(current_user) }, status: :ok
  end

  def destroy
    @character.delete
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  private

  def find_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:user_id, :character_class_id, :party_id, :name, :level, :experience, :gold, :checkmarks, :active, :retired)
  end

end

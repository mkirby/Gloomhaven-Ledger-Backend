class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def find_user_by_username
    user = User.find_by(username: params[:username])
    if user.valid?
      render json: { user: UserSerializer.new(user) }, status: :accepted
    else
      render json: { error: 'failed to find user' }, status: :not_found
    end
  end

  def profile
    @token = encode_token({ user_id: current_user.id })
    render json: { user: UserSerializer.new(current_user), jwt: @token }, status: :accepted
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :bio, :avatar)
  end
end

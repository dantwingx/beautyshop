require 'ostruct'

class Api::V1::AuthController < ApplicationController
  def register
    @user = User.new(user_params)
    if @user.save
      token = encode_token(user_id: @user.id)
      render json: { user: user_json(@user), token: token }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      token = encode_token(user_id: @user.id)
      render json: { user: user_json(@user), token: token }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
  
  def social_login
    auth_data = OpenStruct.new({
      provider: params[:provider],
      uid: params[:uid],
      info: OpenStruct.new({
        email: params[:email],
        name: params[:name],
        phone: params[:phone]
      })
    })
    
    @user = User.from_omniauth(auth_data)
    
    if @user.persisted?
      token = encode_token(user_id: @user.id)
      render json: { user: user_json(@user), token: token }, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  private
  
  def user_params
    params.permit(:email, :password, :name, :phone, :role)
  end
  
  def user_json(user)
    {
      id: user.id,
      email: user.email,
      name: user.name,
      phone: user.phone,
      role: user.role
    }
  end
end

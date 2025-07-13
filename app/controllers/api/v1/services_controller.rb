class Api::V1::ServicesController < ApplicationController
  before_action :set_shop
  before_action :set_service, only: [:show, :update, :destroy]
  
  def index
    @services = @shop.services
    render json: @services.map { |service| service_json(service) }
  end
  
  def show
    render json: service_json(@service)
  end
  
  def create
    @service = @shop.services.build(service_params)
    if @service.save
      render json: service_json(@service), status: :created
    else
      render json: { errors: @service.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def update
    if @service.update(service_params)
      render json: service_json(@service)
    else
      render json: { errors: @service.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @service.destroy
    head :no_content
  end
  
  private
  
  def set_shop
    @shop = Shop.find(params[:shop_id])
  end
  
  def set_service
    @service = @shop.services.find(params[:id])
  end
  
  def service_params
    params.permit(:name, :description, :price, :duration)
  end
  
  def service_json(service)
    {
      id: service.id,
      name: service.name,
      description: service.description,
      price: service.price,
      duration: service.duration,
      shop_id: service.shop_id
    }
  end
end

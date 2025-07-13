class Api::V1::ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :update, :destroy]
  
  def index
    @shops = Shop.all
    
    if params[:category].present?
      @shops = @shops.where(category: params[:category])
    end
    
    if params[:search].present?
      @shops = @shops.left_joins(:services)
                     .where("shops.name ILIKE :search OR services.name ILIKE :search", search: "%#{params[:search]}%")
                     .distinct
    end
    
    if params[:latitude].present? && params[:longitude].present?
      @shops = @shops.nearby(params[:latitude], params[:longitude], params[:distance] || 5)
    end
    
    render json: @shops.map { |shop| shop_json(shop) }
  end
  
  def show
    render json: shop_json(@shop, include_services: true)
  end
  
  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      render json: shop_json(@shop), status: :created
    else
      render json: { errors: @shop.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def update
    if @shop.update(shop_params)
      render json: shop_json(@shop)
    else
      render json: { errors: @shop.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @shop.destroy
    head :no_content
  end
  
  private
  
  def set_shop
    @shop = Shop.find(params[:id])
  end
  
  def shop_params
    params.permit(:name, :description, :address, :phone, :category, opening_hours: {})
  end
  
  def shop_json(shop, include_services: false)
    json = {
      id: shop.id,
      name: shop.name,
      description: shop.description,
      address: shop.address,
      latitude: shop.latitude,
      longitude: shop.longitude,
      phone: shop.phone,
      category: shop.category,
      opening_hours: shop.opening_hours,
      image_urls: shop.image_urls || []
    }
    
    if include_services
      json[:services] = shop.services.map do |service|
        {
          id: service.id,
          name: service.name,
          description: service.description,
          price: service.price,
          duration: service.duration
        }
      end
    end
    
    json
  end
end

class Api::V1::BookingsController < ApplicationController
  before_action :authorized
  before_action :set_booking, only: [:show, :update, :destroy]
  
  def index
    @bookings = current_user.bookings.includes(:shop, :service)
    
    if params[:status].present?
      @bookings = @bookings.where(status: params[:status])
    end
    
    render json: @bookings.map { |booking| booking_json(booking) }
  end
  
  def show
    render json: booking_json(@booking)
  end
  
  def create
    @booking = current_user.bookings.build(booking_params)
    @booking.status = :pending
    
    if @booking.save
      render json: booking_json(@booking), status: :created
    else
      render json: { errors: @booking.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def update
    if @booking.update(booking_params)
      render json: booking_json(@booking)
    else
      render json: { errors: @booking.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @booking.destroy
    head :no_content
  end
  
  private
  
  def set_booking
    @booking = current_user.bookings.find(params[:id])
  end
  
  def booking_params
    params.permit(:shop_id, :service_id, :stylist_id, :booking_date, :booking_time, :status)
  end
  
  def booking_json(booking)
    json = {
      id: booking.id,
      booking_date: booking.booking_date,
      booking_time: booking.booking_time.strftime("%H:%M"),
      status: booking.status,
      total_price: booking.total_price,
      created_at: booking.created_at,
      shop: {
        id: booking.shop.id,
        name: booking.shop.name,
        address: booking.shop.address,
        phone: booking.shop.phone
      },
      service: {
        id: booking.service.id,
        name: booking.service.name,
        price: booking.service.price,
        duration: booking.service.duration
      }
    }
    
    if booking.stylist.present?
      json[:stylist] = {
        id: booking.stylist.id,
        name: booking.stylist.name,
        specialty: booking.stylist.specialty,
        experience_years: booking.stylist.experience_years,
        image_url: booking.stylist.image_url
      }
    end
    
    json
  end
end

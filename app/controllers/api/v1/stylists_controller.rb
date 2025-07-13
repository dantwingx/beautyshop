class Api::V1::StylistsController < ApplicationController
  before_action :set_shop
  before_action :set_stylist, only: [:show, :available_times]
  
  def index
    @stylists = @shop.stylists.includes(:time_slots)
    render json: @stylists.map { |stylist| stylist_json(stylist) }
  end
  
  def show
    render json: stylist_json(@stylist, include_time_slots: true)
  end
  
  def available_times
    date = Date.parse(params[:date])
    
    # 해당 날짜의 타임슬롯이 없으면 생성
    @stylist.generate_time_slots_for_date(date)
    
    time_slots = @stylist.available_times_on(date)
    render json: time_slots.map { |slot| time_slot_json(slot) }
  end
  
  private
  
  def set_shop
    @shop = Shop.find(params[:shop_id])
  end
  
  def set_stylist
    @stylist = @shop.stylists.find(params[:id])
  end
  
  def stylist_json(stylist, include_time_slots: false)
    json = {
      id: stylist.id,
      name: stylist.name,
      specialty: stylist.specialty,
      experience_years: stylist.experience_years,
      rating: stylist.rating,
      image_url: stylist.image_url,
      bio: stylist.bio
    }
    
    if include_time_slots
      json[:available_dates] = stylist.time_slots
        .available
        .where('date >= ?', Date.current)
        .distinct
        .pluck(:date)
        .sort
    end
    
    json
  end
  
  def time_slot_json(slot)
    {
      id: slot.id,
      date: slot.date,
      start_time: slot.start_time.strftime('%H:%M'),
      end_time: slot.end_time.strftime('%H:%M'),
      is_available: slot.is_available
    }
  end
end

class ApplicationController < ActionController::API
  include JwtAuthenticatable
  
  # Handle CORS preflight requests
  def cors_preflight_check
    head :ok
  end
end

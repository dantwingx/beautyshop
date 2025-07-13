class HealthController < ApplicationController
  def check
    render json: { 
      status: "ok", 
      timestamp: Time.current.iso8601,
      version: "1.0.0",
      database: database_check
    }
  end

  private

  def database_check
    ActiveRecord::Base.connection.execute("SELECT 1")
    "connected"
  rescue StandardError => e
    "error: #{e.message}"
  end
end
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_date
  def set_date
  @date_loaded = Time.now.strftime "%Y/%d/%m %I:%M%p"
  end
end

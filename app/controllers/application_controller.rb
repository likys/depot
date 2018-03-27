class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_date
  before_action :increment_count
  def set_date
  @date_loaded = Time.now.strftime "%Y/%d/%m %I:%M%p"
  end

  def increment_count
    @counter = session[:counter]
    @counter.nil? ? @counter = 1 : @counter+=1
    session[:counter] = @counter
  end

  def reset_session_counter
    if not session[:counter].nil?
      session[:counter] = 0
    end
  end
  
end

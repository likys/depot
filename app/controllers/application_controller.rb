class ApplicationController < ActionController::Base
  before_action :authorize
  protect_from_forgery with: :exception
  before_action :set_date
  before_action :increment_count
  before_action :set_i18n_locale_from_params
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
  protected

  def authorize
    if request.format == Mime[:html]
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    else
      authenticate_or_request_with_http_basic do |username, password|
        user = User.find_by(name: username)
        user && user.authenticate(password)
      end
    end
  end
  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.map(&:to_s).include?(params[:locale])
        I18n.locale = params[:locale]
      else
        flash.now[:notice] = "#{params[:locale]} translation not available"
        logger.error flash.now[:notice]
      end
    end
  end
end


class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authorize
  protect_from_forgery with: :exception
#  before_filter :set_i18n_locale_from_params

  private

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id]=cart.id
    cart
  end

  def increment_count
    if session[:counter].nil?
    session[:counter] = 0
    end
  session[:counter] += 1
  end

  protected

  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, notice: "Пожалуйста пройдите авторизацию"
    end
  end

#  def set_i18n_locale_from_params
#    if params[:locale]
#      if I18n.available_locales.include?(params[:locale].to_sym)
#        I18n.locale = params[:locale]
#      else
#        flash.now[:notice]=
#          "#{params[:locale]} перевод недоступен"
#          logger.error flash.now[:notice]
#        end
#      end
#    end

#    def default_url_options
#      { locale: I18n.locale }
#    end

end

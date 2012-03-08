class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  def set_locale
    new_locale = params[:locale] || extract_locale_from_config || Rails.application.config.i18n.default_locale || I18n.default_locale
    Rails.application.config.i18n.default_locale = new_locale
    Rails.application.config.i18n.locale = new_locale
    Rails.logger.info "Rails.application.config.i18n is [#{Rails.application.config.i18n.locale}], default_locale is [#{Rails.application.config.i18n.default_locale}]"
    I18n.default_locale = new_locale
    I18n.locale = new_locale
    Rails.logger.info "I18n is [#{I18n.locale}], default_locale is [#{I18n.default_locale}]"
  end

  def extract_locale_from_config
    if Rails.application.config.respond_to? "locale"
      return Rails.application.config.locale
    else
      return nil
    end
  end
end

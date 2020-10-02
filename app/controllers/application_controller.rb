class ApplicationController < ActionController::Base
  before_action :set_languages

  private
    def set_languages
      @languages = I18n.available_locales
      print("languages:", @languages)
    end

  def default_url_options
    { locale: I18n.locale }
  end

end

class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_locale

  private

  def set_locale
    # URLに ?locale=en などがあればそれを使い、なければ日本語(:ja)をデフォルトにする
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # 💡 ページを移動しても ?locale=en をURLに自動で引き継ぐためのお守り
  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end
end

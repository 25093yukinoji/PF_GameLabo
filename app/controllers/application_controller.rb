class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
# ログイン後の偏移先
  def after_sign_in_path_for(_resource)
    my_page_path
  end

  protected
# 名前のカラム追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

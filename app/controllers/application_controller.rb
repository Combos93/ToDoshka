class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_user_can_edit?

  protected

  def configure_permitted_parameters
    added_attrs = [:password, :password_confirmation, :current_password]

    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def current_user_can_edit?(model)
    user_signed_in? && (
      model.user == current_user ||
      (model.try(:todolist).present? && model.todolist.user == current_user)
    )
  end
end

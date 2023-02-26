class ApplicationController < ActionController::Base
  before_action exvept: [:top] 
  # ↑ログインしていないと他のページに行けない設定
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    user_path(current_user)
      # flash[:notice] = " Welcome! You have signed up successfully."
  end

  def after_sign_in_path_for(resource)
    user_path(current_user)
    # flash[:notice] = " Signed in successfully."
  end
  
  def after_sign_out_path_for(resource)
    # flash[:notice] = " Signed out successfully."
    root_path
  end
  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end

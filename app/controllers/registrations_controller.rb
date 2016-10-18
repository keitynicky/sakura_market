class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    common_user_params
  end

  def account_update_params
    common_user_params.merge(:current_password)
  end

end
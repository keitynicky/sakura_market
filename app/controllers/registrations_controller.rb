class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    common_params
  end

  def account_update_params
    common_params.merge(:current_password)
  end

  def common_params
    params.require(:user).permit(:postal_code, :address_level1, :address_level2,:address_line1,:address_line2,:email, :password, :password_confirmation)    
  end

end
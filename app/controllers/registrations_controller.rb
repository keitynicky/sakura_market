class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    common_params
  end

  def account_update_params
    # common_params.merge(:current_password)
    common_params
  end

  def common_params
    params.require(:user).permit(:postal_code, :address_level1, :address_level2,:address_line1,:address_line2,:email, :password, :family_name, :given_name, :password_confirmation)    
  end

end
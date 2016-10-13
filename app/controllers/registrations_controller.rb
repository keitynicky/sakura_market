class RegistrationsController < Devise::RegistrationsController

  protected

  # TODO：処理の共通化やシンプルにできないか等の要検討
  def update_resource(resource, params)
    if params[:password].blank? && params[:password_confirmation].blank?
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end

  def signed_in_root_path(resource)
     if params[:password].blank? && params[:password_confirmation].blank?
       return delivery_check_out_path
     else
       return root_path
     end
  end

  private

  def sign_up_params
    common_params
  end

  def account_update_params
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      common_params
    else
      common_params.merge(:current_password)
    end
  end

  def common_params
    params.require(:user).permit(:postal_code, :address_level1, :address_level2,:address_line1,:address_line2,:email, :password, :family_name, :given_name, :password_confirmation)    
  end

end
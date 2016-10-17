class RegistrationsController < Devise::RegistrationsController

  def user_info
    # p self.resource.errors
    render :user_info
  end

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      bypass_sign_in resource, scope: resource_name
      respond_with resource, location: after_update_path_for(resource)
    else
      if account_update_params.has_key?(:password)
        clean_up_passwords resource
        respond_with resource
      else
        render :user_info
      end
    end
  end

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
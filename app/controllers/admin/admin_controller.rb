class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin?

  def authenticate_admin?
    unless current_user.admin?
      throw(:abort)
    end
  end
end

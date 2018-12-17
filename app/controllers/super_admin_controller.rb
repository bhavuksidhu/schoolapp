class SuperAdminController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_is_superadmin

  def dashboard
    @admins = Admin.all
  end

  private
    def ensure_is_superadmin
      unless current_user.superadmin?
         flash[:error] = "*You are not authorized to access this page!"
         redirect_to root_path
      end
    end  
end

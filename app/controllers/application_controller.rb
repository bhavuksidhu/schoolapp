class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    def after_sign_in_path_for(resource)
      if current_user.superadmin?
        redirect_to superadmin_dashboard_index_path
      elsif current_user.admin?
        redirect_to admin_dashboard_index_path
      else
        redirect_to root_path
      end
    end
end




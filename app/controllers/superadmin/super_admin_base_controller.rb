class Superadmin::SuperAdminBaseController < ApplicationController
  before_action :ensure_is_superadmin

private

  def ensure_is_superadmin
    unless current_user.superadmin?
        root_path
       flash[:error] = "you are not authorized to access this page"
    end
  end
end

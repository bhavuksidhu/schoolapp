class Superadmin::DashboardController < Superadmin::SuperAdminBaseController

  def index
    @admin = Admin.all
  end
  
  def new
     @admin = Admin.new
  end
  
  def create
    @admin =  Admin.create(admin_params)
    if @admin.save 
      redirect_to superadmin_dashboard_index_path
    else
      render :new
    end
  end



  def admin_params
    params.require(:admin).permit(:first_name, :last_name, :email, :password)
  end
end

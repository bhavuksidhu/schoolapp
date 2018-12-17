class Superadmin::DashboardController < Superadmin::SuperAdminBaseController
  before_action :get_admin, only: [:edit, :update, :destroy]

  def index
    @admins = Admin.all
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

  def edit
  end


def update
    if @admin.update(admin_params)
      redirect_to superadmin_dashboard_index_path
    else
      render 'edit'
  end
end

def destroy
    @admin.destroy
    redirect_to superadmin_dashboard_index_path
end

private 
  def admin_params
    params.require(:admin).permit(:first_name, :last_name, :email, :password)
  end

  def get_admin
    @admin = Admin.friendly.find(params[:id])
  end  
end

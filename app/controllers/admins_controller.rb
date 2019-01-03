class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_admin, only: [:edit, :update, :destroy]
  before_action :ensure_is_admin, only: [:dashboard]
  before_action :ensure_is_superadmin, only: [:new, :create, :edit, :update, :destroy]


  def dashboard
    @search = Student.search(params[:q])
    @students = @search.result 
  end

  def new
    @admin = Admin.new
  end
  
  def create
    @admin =  Admin.create(admin_params)
    if @admin.save
      flash[:success] = "Admin created successfully!"
      redirect_to dashboard_super_admin_index_path
    else
      flash[:error] = "Something went wrong!"
      render :new
    end
  end

  def edit
  end

  def update
    if @admin.update(admin_params)
      redirect_to dashboard_admins_path
    else
      render 'edit'
    end
  end

  def destroy
    @admin.destroy
    redirect_to dashboard_super_admin_index_path
  end

  private
    def ensure_is_admin
      unless current_user.admin?
        flash[:error] = "*You are not authorize to view this page!"
        redirect_to root_path
      end
    end

    def ensure_is_superadmin
      unless current_user.superadmin?
        flash[:error] = "*You are not authorize to perform this action!"
        redirect_to root_path
      end
    end    

    def admin_params
      params.require(:admin).permit(:first_name, :last_name, :email, :password)
    end

    def get_admin
      @admin = Admin.friendly.find(params[:id])
    end     
end

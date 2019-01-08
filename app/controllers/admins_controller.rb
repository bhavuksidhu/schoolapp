class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_admin, only: [:edit, :update, :destroy]
  # before_action :ensure_is_admin, only: [:dashboard]
  # before_action :ensure_is_superadmin,:ensure_is_admin, only: [:new, :create, :edit, :update, :destroy]


  def dashboard
    @search = Student.ransack(params[:q])
    @students = @search.result
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end
  
  def create
     @admin =  Admin.create(admin_params)
    if @admin.save
      flash[:success] = "Admin created successfully!"
      redirect_to dashboard_admins_path
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
    redirect_to  dashboard_admins_path
  end

  
    def admin_params
      params.require(:admin).permit(:full_name,  :email, :password,:password_confirmation)
    end

    def get_admin
      @admin = Admin.friendly.find(params[:id])
    end     
end

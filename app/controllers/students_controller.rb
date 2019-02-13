class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_authorize_to_create_student
  before_action :get_student, only: [:edit, :update, :show, :destroy]

  def index
    params[:page] ||= 1
    @search = Student.search(params[:q])
    @students = @search.result.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')

  end

  def new
    @student = Student.new
    @student.build_student_detail
    @student.student_attachments.build
  end

  def create
    @student = Student.new(student_params)
    @student.email = Time.now.strftime("%Y%m%d%H%M%S") + "@email.com"
    if @student.save
      flash[:success] = "Student saved successfully!"
      redirect_to dashboard_admins_path
    else
      flash[:error] = "Something went wrong, please try later!"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @student.destroy()
  end

  def update
    if @student.update(student_params)
      flash[:success] = "Student updated successfully!"
      redirect_to student_path
    else
      flash[:error] = "Something went wrong!"
      render :edit
    end
  end

private
  def is_authorize_to_create_student
    unless current_user.superadmin? || current_user.admin?
      flash[:error] = "*You are not authorize to perform this action!"
      redirect_to root_path
    end
  end

  def student_params
    params[:student][:student_detail_attributes][:fee_paid] = params[:student][:student_detail_attributes][:fee_paid].to_i
    params.require(:student).permit(:full_name, :password,
                                      student_detail_attributes: [:id, :dob, :father_name,  :admission_date, :standard_id, :fee_paid, :_destroy,:about,:section],
                                      student_attachments_attributes: [:id, :attachment, :_destroy])
  end

  def get_student
    @student = Student.friendly.find(params[:id])
  end
end
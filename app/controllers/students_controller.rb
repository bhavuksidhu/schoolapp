class StudentsController < ApplicationController
  before_action :is_authorize_to_create_student

  def index
    @search = Student.search(params[:q])
    @students = @search.result
  end

  def new
    @student = Student.new
    @student.build_student_detail
    @student.student_attachments.build
  end

  def create
    @student = Student.new(student_params)
    @student.email = @student.first_name + Time.now.strftime("%Y%m%d%H%M%S") + "@email.com"
    if @student.save
      flash[:success] = "Student saved successfully!"
      redirect_to students_path
    else
      flash[:error] = "Something went wrong, please try later!"
      render :new
    end
  end

  def show
    @student = Student.friendly.find(params[:id])
  end

  def edit
  end

private
  def is_authorize_to_create_student
    unless current_user.superadmin? || current_user.admin?
      flash[:error] = "*You are not authorize to perform this action!"
      redirect_to root_path
    end
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :password,
                                      student_detail_attributes: [:id, :dob, :father_name,  :admission_date, :standard_id, :_destroy],
                                      student_attachments_attributes: [:id, :attachment, :_destroy])
  end   
end
class Admin::DashboardController < Admin::AdminbaseController

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
    @student.build_student_detail
  end

  def show
    @student = Student.find(params[:id]) rescue nil
    if @student.blank?
      redirect_to admin_dashboard_index_path
    end
  end

  def create
    @student = Student.new(student_params)
    @student.email = @student.first_name + Time.now.strftime("%Y%m%d%H%M%S") + "@email.com"
    if @student.save
      redirect_to admin_dashboard_index_path
      flash[:success] = "Student Created Successfully"
    else
      flash[:error] = "Something Went Wrong"
      render :new
    end
  end

  private
  def student_params
    params.require(:student).permit(
    :first_name, :last_name, :password,
    student_detail_attributes: [ :dob, :father_name, :uid_pic, :admission_date, :standard_id])
  end
end

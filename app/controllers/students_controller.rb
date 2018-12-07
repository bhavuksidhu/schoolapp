class StudentsController < ApplicationController

  def index
  	@students = Student.all
	end

  def show
  	@student = Student.friendly.find(params[:id])
  end
end

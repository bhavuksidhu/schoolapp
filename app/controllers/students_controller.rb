class StudentsController < ApplicationController

  def index
  	@search = Student.search(params[:q])
    @students = @search.result
	end

  def show
  	@student = Student.friendly.find(params[:id])
  end
end
class AddAboutToStudentDetail < ActiveRecord::Migration[5.1]
  def change
    add_column :student_details, :about, :text
  end
end

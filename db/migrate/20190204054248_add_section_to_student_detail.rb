class AddSectionToStudentDetail < ActiveRecord::Migration[5.1]
  def change
    add_column :student_details, :section, :string
  end
end

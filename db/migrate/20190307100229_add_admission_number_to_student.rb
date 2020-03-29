class AddAdmissionNumberToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :student_details, :admission_number, :string
  end
end

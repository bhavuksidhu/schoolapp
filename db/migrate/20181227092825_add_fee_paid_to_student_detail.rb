class AddFeePaidToStudentDetail < ActiveRecord::Migration[5.1]
  def change
    add_column :student_details, :fee_paid, :integer
  end
end

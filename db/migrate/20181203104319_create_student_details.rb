class CreateStudentDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :student_details do |t|
      t.date :dob
      t.string :father_name
      t.string :uid_pic
      t.date :admission_date
      t.references :standard, foreign_key: true

      t.timestamps
    end
  end
end

class CreateStudentUids < ActiveRecord::Migration[5.1]
  def change
    create_table :student_attachments do |t|
      t.string :attachment
      t.integer :student_id

      t.timestamps
    end
  end
end

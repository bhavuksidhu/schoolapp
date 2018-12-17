class Student < User
  has_one :student_detail
  has_many :student_attachments
  accepts_nested_attributes_for :student_detail
  accepts_nested_attributes_for :student_attachments
end
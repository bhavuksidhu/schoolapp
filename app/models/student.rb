class Student < User
  has_one :student_detail
  accepts_nested_attributes_for :student_detail  
end

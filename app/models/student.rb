class Student < User
  has_one :student_detail
  has_many :student_attachments
  accepts_nested_attributes_for :student_detail
  accepts_nested_attributes_for :student_attachments
  # belongs_to :creator, class_name: User.to_s, foreign_key: "created_by_id"
  # belongs_to :admin, class_name: User.to_s, foreign_key: "created_by_id"

  
end
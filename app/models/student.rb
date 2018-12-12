class Student < User
  has_one :student_detail
  accepts_nested_attributes_for :student_detail
  # belongs_to :creator, class_name: User.to_s, foreign_key: "created_by_id"
  # belongs_to :admin, class_name: User.to_s, foreign_key: "created_by_id"

  def name
    if first_name.present? && last_name.present?
      first_name+ " " +last_name
	  else
	  	return nil
	  end
  end
end
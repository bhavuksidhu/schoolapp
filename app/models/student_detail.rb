class StudentDetail < ApplicationRecord
  belongs_to :standard
  belongs_to :student
  mount_uploader :uid_pic, UidPicUploader
end
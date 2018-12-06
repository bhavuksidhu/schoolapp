class StudentDetail < ApplicationRecord
  belongs_to :standard
  belongs_to :student
  # mount_uploader :image, Imageuploader
end
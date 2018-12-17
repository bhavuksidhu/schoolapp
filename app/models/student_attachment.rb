class StudentAttachment < ApplicationRecord
  belongs_to :student
  mount_uploader :attachment, StudentAttachmentUploader
end

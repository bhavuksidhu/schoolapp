class StudentDetail < ApplicationRecord
  belongs_to :standard
  belongs_to :student
end
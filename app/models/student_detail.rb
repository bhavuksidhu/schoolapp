class StudentDetail < ApplicationRecord
  belongs_to :standard
  belongs_to :student
  enum fee_paid: {No_fee_paid:0, April: 1, May: 2, June: 3, July: 4,  August: 5, September: 6,  October: 7, November: 8,  December: 9, January: 10,  February: 11,  March: 12}
end
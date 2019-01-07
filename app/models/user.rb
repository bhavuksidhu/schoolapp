class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  extend FriendlyId
  friendly_id :full_name, use: :slugged

  ROLE = %w(SuperAdmin Admin Student)

  validates :type, inclusion: { in: ROLE }

  ROLE.each do |method|
   define_method "#{method.downcase}?" do
     type == method
   end
 end
end

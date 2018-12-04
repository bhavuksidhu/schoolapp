class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLE = %w(SuperAdmin Admin Student)

  validates :type, inclusion: { in: ROLE }

  ROLE.each do |method|
   define_method "#{method.downcase}?" do
     type == method
   end
 end

end

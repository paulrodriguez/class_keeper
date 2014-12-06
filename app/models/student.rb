class Student < ActiveRecord::Base
  belongs_to :account, class_name: 'User'
  has_many :lectures, through: :enrollments
  validates :user_id, presence: true
  
end

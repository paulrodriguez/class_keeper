class Student < ActiveRecord::Base
  belongs_to :account, class_name: 'User', foreign_key: 'user_id'
  has_many :lectures, through: :enrollments
  validates :user_id, presence: true
  
end

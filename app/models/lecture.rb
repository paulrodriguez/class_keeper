class Lecture < ActiveRecord::Base
  belongs_to :school
  has_many :students, through: :enrollments
end

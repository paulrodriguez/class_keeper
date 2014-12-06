class User < ActiveRecord::Base
  has_one :student, dependent: :destroy
  has_one :teacher, dependent: :destroy
  belongs_to :school

  validates :first, presence: true
  validates :last, presence: true
  validates :school_id, presence: true, numericality: { only_integer: true}
  validates :user_type, :inclusion => { :in => [1,2] }
  validates :email, uniqueness: true, presence: true
  validates :password, length: { minimum: 8 }, confirmation: true, presence: true
end

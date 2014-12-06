class Teacher < ActiveRecord::Base
  belongs_to :account, class_name: 'User'
  validates :user_id, presence: true
end

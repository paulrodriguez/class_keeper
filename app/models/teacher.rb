class Teacher < ActiveRecord::Base
  belongs_to :account, class_name: 'User', foreign_key: 'user_id'
  validates :user_id, presence: true
end

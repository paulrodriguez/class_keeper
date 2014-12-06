class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :student_id
      t.integer :lecture_id
      t.string :grade
      t.timestamps
    end
  end
end

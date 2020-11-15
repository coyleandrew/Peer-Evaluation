class CreateCourseRosters < ActiveRecord::Migration[6.0]
  def change
    create_table :course_rosters do |t|
      t.references :course, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

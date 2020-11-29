class CourseRoster < ApplicationRecord
  belongs_to :course
  belongs_to :user
  has_many :teams, through: :team_members
end

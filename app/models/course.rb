class Course < ApplicationRecord
    has_many :projects
    has_many :teams
    has_many :faculties
    has_many :course_rosters
end

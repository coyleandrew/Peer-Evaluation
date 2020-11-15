class Project < ApplicationRecord
  belongs_to :course
  has_many :project_teams
end

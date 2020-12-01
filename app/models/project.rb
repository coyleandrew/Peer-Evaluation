class Project < ApplicationRecord
  belongs_to :course
  has_many :project_teams
  validates :name, :presence => true
end

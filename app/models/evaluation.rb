class Evaluation < ApplicationRecord
  belongs_to :project
  belongs_to :user
  belongs_to :team_member
  validates :score, :comment, :presence => true
end

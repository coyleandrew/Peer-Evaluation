class CreateTeamMemberProjectScores < ActiveRecord::Migration[6.0]
  def change
    create_table :team_member_project_scores do |t|
      t.integer :score
      t.references :team_member, null: false, foreign_key: true
      t.references :project_team, null: false, foreign_key: true

      t.timestamps
    end
  end
end

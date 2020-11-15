class CreateEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluations do |t|
      t.integer :score
      t.string :comment
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :team_member, null: false, foreign_key: true

      t.timestamps
    end
  end
end

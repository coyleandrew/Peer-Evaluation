class CreateFaculties < ActiveRecord::Migration[6.0]
  def change
    create_table :faculties do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :teachersAssistant
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end

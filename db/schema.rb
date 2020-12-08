# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_08_213010) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_rosters", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_course_rosters_on_course_id"
    t.index ["user_id"], name: "index_course_rosters_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer "score"
    t.string "comment"
    t.bigint "project_id", null: false
    t.bigint "user_id", null: false
    t.bigint "team_member_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_evaluations_on_project_id"
    t.index ["team_member_id"], name: "index_evaluations_on_team_member_id"
    t.index ["user_id"], name: "index_evaluations_on_user_id"
  end

  create_table "faculties", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "teachersAssistant"
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_faculties_on_course_id"
    t.index ["user_id"], name: "index_faculties_on_user_id"
  end

  create_table "project_teams", force: :cascade do |t|
    t.integer "score"
    t.bigint "team_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_project_teams_on_project_id"
    t.index ["team_id"], name: "index_project_teams_on_team_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.datetime "due"
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_projects_on_course_id"
  end

  create_table "team_member_project_scores", force: :cascade do |t|
    t.integer "score"
    t.bigint "team_member_id", null: false
    t.bigint "project_team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_team_id"], name: "index_team_member_project_scores_on_project_team_id"
    t.index ["team_member_id"], name: "index_team_member_project_scores_on_team_member_id"
  end

  create_table "team_members", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "course_roster_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_roster_id"], name: "index_team_members_on_course_roster_id"
    t.index ["team_id"], name: "index_team_members_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_teams_on_course_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password"
  end

  add_foreign_key "course_rosters", "courses"
  add_foreign_key "course_rosters", "users"
  add_foreign_key "evaluations", "projects"
  add_foreign_key "evaluations", "team_members"
  add_foreign_key "evaluations", "users"
  add_foreign_key "faculties", "courses"
  add_foreign_key "faculties", "users"
  add_foreign_key "project_teams", "projects"
  add_foreign_key "project_teams", "teams"
  add_foreign_key "projects", "courses"
  add_foreign_key "team_member_project_scores", "project_teams"
  add_foreign_key "team_member_project_scores", "team_members"
  add_foreign_key "team_members", "course_rosters"
  add_foreign_key "team_members", "teams"
  add_foreign_key "teams", "courses"
end

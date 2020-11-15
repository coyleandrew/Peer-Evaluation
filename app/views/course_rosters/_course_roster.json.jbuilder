json.extract! course_roster, :id, :course_id, :user_id, :created_at, :updated_at
json.url course_roster_url(course_roster, format: :json)

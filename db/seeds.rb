# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create team users
users = [
    User.create(email: 'coyle.128@osu.edu', admin: true),
    User.create(email: 'dettmer.16@osu.edu', admin: true),
    User.create(email: 'li.9096@osu.edu', admin: true),
    User.create(email: 'slaven.18@osu.edu', admin: true),
    User.create(email: 'xue.409@osu.edu', admin: true)]

# Create faculty users
fUsers = [
    User.create(email: 'soundarajan.3@osu.edu', admin: false)]

# Create a sample courses
course1 = Course.create(name: 'Course 1')

# Assign faculty users to course
fUsers.each do |u|
    CourseRoster.create(user: u, course_id: course1.id)
end

# Enroll team members in course via CourseRoster
users.each do |u|
    CourseRoster.create(user: u, course_id: course1.id)
end


# Create some course teams
team1 = Team.create(name: 'Team1', course_id: course1.id)
team2 = Team.create(name: 'Team2', course_id: course1.id)

# Add the first 3 users to Team1
users.take(3).each do |u|
    TeamMember.create(team_id: team1.id, course_roster_id: CourseRoster.find_by(user: u).id)
end

# Team2 otherwise
users.drop(3).each do |u|
    TeamMember.create(team_id: team2.id, course_roster_id: CourseRoster.find_by(user: u).id)
end

# Create some projects
# Overdue
project1 = Project.create(name: 'Project1', due: DateTime.now.next_day(-14), course_id: course1.id)
# Due now
project2 = Project.create(name: 'Project2', due: DateTime.now, course_id: course1.id)
# Due later
project3 = Project.create(name: 'Project3', due: DateTime.now.next_day(14), course_id: course1.id)

# Assign team 1 to project 1
ProjectTeam.create(team_id: team1.id, project_id: project1.id)

# Assign team 2 to project 2
ProjectTeam.create(team_id: team2.id, project_id: project2.id)

# Assign both teams to project 3
ProjectTeam.create(team_id: team1.id, project_id: project3.id)
ProjectTeam.create(team_id: team2.id, project_id: project3.id)


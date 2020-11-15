Rails.application.routes.draw do
  resources :team_member_project_scores
  resources :team_members
  resources :evaluations
  resources :project_teams
  resources :faculties
  resources :course_rosters
  resources :teams
  resources :projects
  resources :courses
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

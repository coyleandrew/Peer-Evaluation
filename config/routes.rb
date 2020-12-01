Rails.application.routes.draw do
  root to:   "home#index"
  resources :team_member_project_scores
  resources :evaluations, only: [:show]
  get 'evaluations/new/:projectId/:teamMemberId' => 'evaluations#new'
  post 'evaluations/new/:projectId/:teamMemberId', to: 'evaluations#create', as: 'submit_evaluation'
  resources :login, only: [:new, :create, :destroy]
  get 'login', to: 'login#new'
  get 'logout', to: 'login#destroy'
  resources :faculties
  resources :team_members
  resources :projects
  resources :course_rosters
  resources :courses do
    resources :teams do
      resources :team_members
    end
    resources :projects do
      resources :project_teams
    end
    resources :course_rosters
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

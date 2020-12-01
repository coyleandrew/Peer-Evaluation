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
  resources :course_rosters
  resources :courses do
    resources :evaluations
    resources :teams do
      resources :team_members
      resources :evaluations
    end
    resources :projects do
      resources :project_teams do
        resources :evaluations
        resources :team_member_project_scores, :path => "scores"
      end
      resources :evaluations
    end
    resources :course_rosters
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root to:'tasks#index', column: "created_at", order:'DESC'
  resources :tasks
end

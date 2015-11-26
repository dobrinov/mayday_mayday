Rails.application.routes.draw do
  resources :metrics
  resources :thresholds
  resources :hosts
  resources :alerts
  resources :maintenances
  resources :incidents
end

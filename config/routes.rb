Rails.application.routes.draw do
  resources :metrics do
    resources :measurements
  end

  # resources :thresholds
  # resources :hosts
  # resources :alerts
  # resources :maintenances
  # resources :incidents
end

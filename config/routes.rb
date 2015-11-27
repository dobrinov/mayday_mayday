Rails.application.routes.draw do

  get 'metrics', to: 'metrics#index'
  get 'metrics/:layer.:name/measurements', to: 'measurements#index',
                                         as: 'metric_measurements',
                                         constraints: {
                                           layer: /[a-z_]+/,
                                           name:  /(([a-z_]+)\.?)+/
                                         }

  # resources :thresholds
  # resources :hosts
  # resources :alerts
  # resources :maintenances
  # resources :incidents
end

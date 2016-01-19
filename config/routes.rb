Rails.application.routes.draw do

  get 'metrics', to: 'metrics#index'

  get 'metrics/:layer', to: 'metrics#index',
                        as: 'metrics_layer',
                        constraints: {
                          layer: /[a-z_]+/
                        }

  get 'metrics/:layer/:name/measurements', to: 'measurements#index',
                                           as: 'metric_measurements',
                                           constraints: {
                                             layer: /[a-z_]+/,
                                             name:  /(([a-z_]+)\.?)+/
                                           }

  namespace :alerting do
    resources :policies do
      resources :conditions

      delete 'value_condition/:id', to: 'conditions#destroy',
                                    as: 'value_condition'
    end

    get 'incidents', to: 'incidents#index'
  end
end

Rails.application.routes.draw do
  resources :zones do
    resources :schedules, shallow: true
  end
end

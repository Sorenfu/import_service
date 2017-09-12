Rails.application.routes.draw do

  resources :sheets, only: :index
  root 'sheets#index'
end

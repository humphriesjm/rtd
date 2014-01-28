RtdRailsApp::Application.routes.draw do
  
  # home routes
  get "home/index"
  get "home/about"
  get "home/events"
  get "home/registration"
  get "home/social"
  get "home/press"
  get "home/contact"

  resources :events
  resources :users
  resources :sessions

  # root route
  root 'home#index'
end

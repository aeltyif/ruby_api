Rails.application.routes.draw do
  root 'welcome#index'

  mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks], :controllers => {:registrations => "registrations"}
  resources :jobs do
    get  '/applicants',     to: 'applicants#index'
    post '/applicants',     to: 'applicants#create'
    get  '/applicants/:id', to: 'applicants#show'
  end
  # Custom route to list the job seeker applications
  get 'applications',  to: 'applicants#by_user'
end

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks], :controllers => {:registrations => "registrations"}
  resources :jobs do
    get  '/applicants',     to: 'applicants#index'
    post '/applicants',     to: 'applicants#create'
    get  '/applicants/:id', to: 'applicants#show'
  end
end

Rails.application.routes.draw do

  get 'applications/new'

  get 'jobs/new'

  get 'companies/new'
  get 'sessions/new'
  root 'static_pages#home'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'static_pages#signup'
  get "/signup/recruiter", to: 'recruiters#new'
  get "/signup/job_seeker", to: 'job_seekers#new'
  post "/signup/job_seeker", to: 'job_seekers#create'
  post "/signup/recruiter",  to: 'recruiters#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :recruiters do
    member do
      post 'update_company_id'
    end
  end
  resources :companies
  resources :job_seekers
  resources :jobs
  resources :applications
  resources :admins, only:[:edit, :update,:show]
end

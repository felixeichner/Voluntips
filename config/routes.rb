Rails.application.routes.draw do
  resources :projects
  resources :volun_texts, except: :index

  root "projects#index"
end

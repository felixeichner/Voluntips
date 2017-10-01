Rails.application.routes.draw do

	devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  
  resources :projects
  resources :volun_texts, except: :index

  get 'datenschutz', to: 'legals#datenschutz'
  get 'disclaimer', to: 'legals#disclaimer'
  get 'impressum', to: 'legals#impressum'

  root "projects#index"
end

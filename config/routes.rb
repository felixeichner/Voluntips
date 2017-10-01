Rails.application.routes.draw do
  resources :projects
  resources :volun_texts, except: :index

  get 'datenschutz', to: 'legals#datenschutz'
  get 'disclaimer', to: 'legals#disclaimer'
  get 'impressum', to: 'legals#impressum'

  root "projects#index"
end

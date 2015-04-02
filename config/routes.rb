Rails.application.routes.draw do
  get 'session/create'

  devise_for :users, controllers: { sessions: 'sessions' }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  mount API::Base, at: "/"
  mount GrapeSwaggerRails::Engine, at: "/documentation"
end

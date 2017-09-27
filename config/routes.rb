Rails.application.routes.draw do
  root 'home#index'
  get 'costumes', to: 'costume_voting#index'
  get 'houses', to: 'house_voting#index'

  post 'costume_up_vote/:entry_id', to: 'costume_voting#up_vote', as: 'costume_up_vote'
  post 'costume_down_vote/:entry_id', to: 'costume_voting#down_vote', as: 'costume_down_vote'

  post 'house_up_vote/:entry_id', to: 'house_voting#up_vote', as: 'house_up_vote'
  post 'house_down_vote/:entry_id', to: 'house_voting#down_vote', as: 'house_down_vote'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

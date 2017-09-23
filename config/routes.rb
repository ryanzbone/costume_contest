Rails.application.routes.draw do
  root 'voting#index'
  post 'up_vote/:entry_id', to: 'voting#up_vote'
  post 'down_vote/:entry_id', to: 'voting#down_vote'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

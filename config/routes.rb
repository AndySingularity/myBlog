Blog::Application.routes.draw do

  devise_for :users
  root 'articles#index'

  resources :users
  resources :articles

  get 'users/:id/edit'    => 'users#edit'
  get 'articles/:id/edit' => 'articles#edit'


end

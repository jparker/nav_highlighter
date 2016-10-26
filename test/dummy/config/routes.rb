Rails.application.routes.draw do
  concern :url do
    resource :url, only: [:show]
  end

  resource :home, only: [:show]
  resources :authors, only: [:index, :show], concerns: [:url]
  resources :books, only: [:index, :show], concerns: [:url]  do
    resources :editions, only: [:index]
  end

  mount NavHighlighter::Engine => "/nav_highlighter"
end

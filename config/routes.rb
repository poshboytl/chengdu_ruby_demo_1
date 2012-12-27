GitHooks::Application.routes.draw do
  resources :hooks, only: [:create]
end



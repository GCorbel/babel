Babel::Engine.routes.draw do
  resources :translations, only: [:update, :create], id: /[^\/]*/
end

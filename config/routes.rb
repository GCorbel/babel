Babel::Engine.routes.draw do
  resources :translations, only: :update, id: /[^\/]*/
end

Rails.application.routes.draw do
  mount Babel::Engine => "/babel"

  root "pages#home"
end

Rails.application.routes.draw do
  root 'root#index'
  get 'home' => 'home#index'

  get    'auth' => 'auth#index'
  post   'auth' => 'auth#login'
  delete 'auth' => 'auth#out'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

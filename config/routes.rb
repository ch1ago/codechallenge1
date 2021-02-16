Rails.application.routes.draw do
  root 'root#index'

  get    'auth' => 'auth#index'
  post   'auth' => 'auth#login'
  delete 'auth' => 'auth#out'

  get  'home'                  => 'home#index'
  get  'home/transfers'        => 'home#transfers'
  post 'home/upload_transfers' => 'home#upload_transfers'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

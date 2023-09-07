Rails.application.routes.draw do
  resources :urls, param: :shortened_url do
    get :metrics, to: 'urls#metrics', on: :collection
  end
  root to: proc { [200, {}, ['alive']] }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

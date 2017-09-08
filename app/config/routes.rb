Rails.application.routes.draw do
  get 'status_check/index'

  resources :places

end

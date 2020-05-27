Rails.application.routes.draw do
  get '' => 'home#top'
  get 'result' => 'home#result'
  post 'result' => 'home#result'
  get 'admin' => 'home#admin'
  post 'update' => 'home#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

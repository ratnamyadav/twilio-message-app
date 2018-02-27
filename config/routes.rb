Rails.application.routes.draw do
  resources :twilio_books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "twilio_books#index"
end

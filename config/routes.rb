Rails.application.routes.draw do
  root 'static_pages#btc'
  get 'eth', controller: 'static_pages'
  get 'ltc', controller: 'static_pages'
  get 'xrp', controller: 'static_pages'
  get 'ada', controller: 'static_pages'
  get 'mana', controller: 'static_pages'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
	root "users#index"        
    resources :users
  # we are using the restful routes ruby gave us:
#      Prefix Verb   URI Pattern               Controller#Action
#      root GET    /                         users#index
#     users GET    /users(.:format)          users#index
#           POST   /users(.:format)          users#create
#  new_user GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#      user GET    /users/:id(.:format)      users#show
#           PATCH  /users/:id(.:format)      users#update
#           PUT    /users/:id(.:format)      users#update
#           DELETE /users/:id(.:format)      users#destroy


end
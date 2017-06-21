# == Route Map
#
#                   Prefix Verb   URI Pattern                     Controller#Action
#         new_user_session GET    /users/sign_in(.:format)        devise/sessions#new
#             user_session POST   /users/sign_in(.:format)        devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)       devise/sessions#destroy
#        new_user_password GET    /users/password/new(.:format)   devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)  devise/passwords#edit
#            user_password PATCH  /users/password(.:format)       devise/passwords#update
#                          PUT    /users/password(.:format)       devise/passwords#update
#                          POST   /users/password(.:format)       devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)         devise/registrations#cancel
#    new_user_registration GET    /users/sign_up(.:format)        devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)           devise/registrations#edit
#        user_registration PATCH  /users(.:format)                devise/registrations#update
#                          PUT    /users(.:format)                devise/registrations#update
#                          DELETE /users(.:format)                devise/registrations#destroy
#                          POST   /users(.:format)                devise/registrations#create
#                                 /cable                          #<ActionCable::Server::Base:0x007f805eceb9f0 @mutex=#<Monitor:0x007f805eceb928 @mon_owner=nil, @mon_count=0, @mon_mutex=#<Thread::Mutex:0x007f805eceb8d8>>, @pubsub=nil, @worker_pool=nil, @event_loop=nil, @remote_connections=nil>
#                chatrooms GET    /chatrooms(.:format)            chatrooms#index
#                          POST   /chatrooms(.:format)            chatrooms#create
#             new_chatroom GET    /chatrooms/new(.:format)        chatrooms#new
#            edit_chatroom GET    /chatrooms/:slug/edit(.:format) chatrooms#edit
#                 chatroom GET    /chatrooms/:slug(.:format)      chatrooms#show
#                          PATCH  /chatrooms/:slug(.:format)      chatrooms#update
#                          PUT    /chatrooms/:slug(.:format)      chatrooms#update
#                          DELETE /chatrooms/:slug(.:format)      chatrooms#destroy
#                 messages GET    /messages(.:format)             messages#index
#                          POST   /messages(.:format)             messages#create
#              new_message GET    /messages/new(.:format)         messages#new
#             edit_message GET    /messages/:id/edit(.:format)    messages#edit
#                  message GET    /messages/:id(.:format)         messages#show
#                          PATCH  /messages/:id(.:format)         messages#update
#                          PUT    /messages/:id(.:format)         messages#update
#                          DELETE /messages/:id(.:format)         messages#destroy
# 

Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: "home#index"
  mount ActionCable.server => '/cable'

  resources :chatrooms, param: :slug
  resources :messages
end

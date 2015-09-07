Roomations::Application.routes.draw do

  resources :articles

  ActiveAdmin.routes(self)

  root to: 'pages#home'

  devise_for :users, :controllers=> { omniauth_callbacks: 'users/omniauth_callbacks', sessions:  "users/sessions",  registrations:  "users/registrations"}
#   devise_scope :user do
#     get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
#   end
# match 'auth/:provider/callback', to: 'sessions#create'
# match 'auth/failure', to: redirect('/')
# match 'signout', to: 'sessions#destroy', as: 'signout'

devise_scope :user do
  get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
  #get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
end

  resources :photos
  resources :projects
  resources :share, only: [:show]
  resources :customers, only: [:show, :update] do 
    member do
      get :retake_quiz
    end
  end
  resources :invite_requests, only: [:index, :new, :create]
match 'design_requests/save_project' => 'design_requests#save_project', as: :save_project
  resources :design_requests do
    member do
      post 'remember'
      post :input_discount
      get :retake_quiz
    end
  end

  resources :style_polls, only:  [:new, :create] do
    collection do
      post :reveal
    end
  end

  # Mailchimp
  post 'mailchimp/subscribe' => 'mailchimp#subscribe'

  resources :designers do
    get :info
  end
  #pages
  match '/about-us' => 'pages#about_us', as: :about_us
  match '/faq' => 'pages#faq'
  match '/gallery' => 'galleries#gallery'
  match '/how-it-works' => 'pages#how_it_works', as: :how_it_works
  match '/independent-contractor-agreement' => 'pages#contractor_agreement', as: :contractor_agreement
  match '/policy' => 'pages#policy'
  match '/pricing' => 'pages#pricing'
  match '/terms-of-use' => 'pages#terms_of_use', as: :terms_of_use
  match '/thank-you' => 'pages#thank_you', as: :thank_you
  match 'payments/new' => 'payments#new', as: :new_payment
  match 'payments/confirm' => 'payments#confirm', as: :confirm_payment
  match 'payments/finish' => 'payments#finish', as: :finish_payment
  #submit contact form
  match '/contact-us' => 'contact_form#send_message', via: :post
  match 'share/show/:uid' => 'share#show', as: :show
  match 'gallery/:id' => 'galleries#show', :as => :show
end
#== Route Map
# Generated on 29 Jun 2012 13:12
#
#           admin_comments GET    /admin/comments(.:format)                   admin/comments#index
#                          POST   /admin/comments(.:format)                   admin/comments#create
#        new_admin_comment GET    /admin/comments/new(.:format)               admin/comments#new
#       edit_admin_comment GET    /admin/comments/:id/edit(.:format)          admin/comments#edit
#            admin_comment GET    /admin/comments/:id(.:format)               admin/comments#show
#                          PUT    /admin/comments/:id(.:format)               admin/comments#update
#                          DELETE /admin/comments/:id(.:format)               admin/comments#destroy
#                     root        /                                           pages#home
#         new_user_session GET    /users/sign_in(.:format)                    users/sessions#new
#             user_session POST   /users/sign_in(.:format)                    users/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                   users/sessions#destroy
#   user_omniauth_callback        /users/auth/:action/callback(.:format)      users/omniauth_callbacks#(?-mix:facebook|twitter)
#            user_password POST   /users/password(.:format)                   devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)               devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)              devise/passwords#edit
#                          PUT    /users/password(.:format)                   devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                     users/registrations#cancel
#        user_registration POST   /users(.:format)                            users/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                    users/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                       users/registrations#edit
#                          PUT    /users(.:format)                            users/registrations#update
#                          DELETE /users(.:format)                            users/registrations#destroy
#                          GET    /users/auth/:provider(.:format)             users/omniauth_callbacks#passthru
#                   photos GET    /photos(.:format)                           photos#index
#                          POST   /photos(.:format)                           photos#create
#                new_photo GET    /photos/new(.:format)                       photos#new
#               edit_photo GET    /photos/:id/edit(.:format)                  photos#edit
#                    photo GET    /photos/:id(.:format)                       photos#show
#                          PUT    /photos/:id(.:format)                       photos#update
#                          DELETE /photos/:id(.:format)                       photos#destroy
#                 projects GET    /projects(.:format)                         projects#index
#                          POST   /projects(.:format)                         projects#create
#              new_project GET    /projects/new(.:format)                     projects#new
#             edit_project GET    /projects/:id/edit(.:format)                projects#edit
#                  project GET    /projects/:id(.:format)                     projects#show
#                          PUT    /projects/:id(.:format)                     projects#update
#                          DELETE /projects/:id(.:format)                     projects#destroy
#                 customer GET    /customers/:id(.:format)                    customers#show
#                          PUT    /customers/:id(.:format)                    customers#update
#          design_requests GET    /design_requests(.:format)                  design_requests#index
#                          POST   /design_requests(.:format)                  design_requests#create
#       new_design_request GET    /design_requests/new(.:format)              design_requests#new
#      edit_design_request GET    /design_requests/:id/edit(.:format)         design_requests#edit
#           design_request GET    /design_requests/:id(.:format)              design_requests#show
#                          PUT    /design_requests/:id(.:format)              design_requests#update
#                          DELETE /design_requests/:id(.:format)              design_requests#destroy
#       reveal_style_polls POST   /style_polls/reveal(.:format)               style_polls#reveal
#              style_polls POST   /style_polls(.:format)                      style_polls#create
#           new_style_poll GET    /style_polls/new(.:format)                  style_polls#new
#            designer_info GET    /designers/:designer_id/info(.:format)      designers#info
#                designers GET    /designers(.:format)                        designers#index
#                          POST   /designers(.:format)                        designers#create
#             new_designer GET    /designers/new(.:format)                    designers#new
#            edit_designer GET    /designers/:id/edit(.:format)               designers#edit
#                 designer GET    /designers/:id(.:format)                    designers#show
#                          PUT    /designers/:id(.:format)                    designers#update
#                          DELETE /designers/:id(.:format)                    designers#destroy
#                 about_us        /about-us(.:format)                         pages#about_us
#                      faq        /faq(.:format)                              pages#faq
#                  gallery        /gallery(.:format)                          pages#gallery
#             how_it_works        /how-it-works(.:format)                     pages#how_it_works
#     contractor_agreement        /independent-contractor-agreement(.:format) pages#contractor_agreement
#                   policy        /policy(.:format)                           pages#policy
#                  pricing        /pricing(.:format)                          pages#pricing
#             terms_of_use        /terms-of-use(.:format)                     pages#terms_of_use
#                thank_you        /thank-you(.:format)                        pages#thank_you
#                                 /contact-us(.:format)                       ContactUsApp
#            for_designers        /for_designers(.:format)                    designers#why_become
#           request_invite        /request_invite(.:format)                   designers#request_invite

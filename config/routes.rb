Rails.application.routes.draw do
  
  root "posts#frontpage"
  
  post "/post_vote", :controller => "votes", :action => "post_vote_js"
  post "/comment_vote", :controller => "votes", :action => "comment_vote_js"
  
  get "/my_stream", :controller => "posts", :action => "subscriptions"
  get "/r/:topic_name", :controller => "posts", :action => "topic_specific"
  post "/create_post", :controller => "posts", :action => "create"
  get "/posts/:id", :controller => "posts", :action => "show"
  get "/delete_post/:id", :controller => "posts", :action => "destroy"
  
  post "/create_comment", :controller => "comments", :action => "create"
  get "/delete_comment/:id", :controller => "comments", :action => "destroy"
  
  get "/topics", :controller => "topics", :action => "index"
  
  post "/subscribe", :controller => "subscriptions", :action => "create"
  post "/unsubscribe", :controller => "subscriptions", :action => "unsubscribe"

  devise_for :users
  
  # Routes for Users
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WebGit::Engine, at: "/rails/git"
end

Rails.application.routes.draw do
 
  devise_for :users
  root 'posts#index', as: :root

  get 'posts/new' => 'posts#new', as: :new_post
  post 'posts' => 'posts#create', as: :posts
  get 'posts/:id' => 'posts#show', as: :post
  get 'posts/:id/edit' => 'posts#edit', as: :edit_post
  patch 'posts/:id' => 'posts#update'
  delete 'posts/:id' => 'posts#delete'
  get 'posts/:id/keep-it-coming' => 'posts#upvote', as: :upvote
  get 'posts/:id/fedup' => 'posts#downvote', as: :downvote
end

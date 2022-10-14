Rails.application.routes.draw do
  root 'users#index'
  # User 
  get '/login' => 'users#index'
  get '/register' => "users#new"
  get '/profile' => 'users#show'

  # Subject
  get 'classes' => 'subjects#index'

  #fill before this
  patch 'subject/:id' => 'subjects#update'
  delete 'subjects/:id' => 'subjects#delete'
  get 'subjects/:id' => 'subjects#show'

  # Topic 
  get 'post/new' => 'topic#new'
  get 'subjects/:subject_id/post/:id' => 'topic#show'
  get '/subjects/:subject_id/post/:id/edit' => 'topic#edit'
  delete 'subjects/:subject_id/post/:id' => 'topic#delete'
  patch 'subjects/:subject_id/post/:id' => 'topic#update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

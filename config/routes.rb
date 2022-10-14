Rails.application.routes.draw do
  root 'users#index'
  # User 
  get '/login' => 'users#index'
  get '/register' => "users#new"
  get '/profile' => 'users#show'
  post '/users/login' => 'users#login'
  post '/users' => 'users#create'
  patch '/profile/update_info/:id' => 'users#update_info'
  patch '/profile/update_password/:id' => 'users#update_password'
  
  # Subject
  get 'subjects' => 'subjects#index'
  get 'log_out' => 'subjects#log_out'
  #fill before this
  post 'subjects' => 'subjects#create'
  patch 'subject/:id' => 'subjects#update'
  delete 'subjects/:id' => 'subjects#delete'
  get 'subjects/:id' => 'subjects#show'
  get 'subjects/:id/students' => 'subjects#students'

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

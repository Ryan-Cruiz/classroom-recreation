Rails.application.routes.draw do
  get 'test/new'
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
  post 'subjects/search' => 'subjects#search'
  post 'subjects' => 'subjects#create'
  # patch 'subjects/:id' => 'subjects#update'
  # delete 'subjects/:id' => 'subjects#delete'
  get 'subjects/:id' => 'subjects#show'
  # Students

  get 'subjects/:id/students' => 'students#index'
  post 'students/:id/search' => 'students#search'
  post 'students/:subject_id/add/:id' => 'students#create'
  # Topic 

  # get 'post/new' => 'topic#new'
  get '/to_do' =>'topic#show'
  get 'subjects/:subject_id/post/:id' => 'topic#index'
  post '/subjects/:id/post' => 'topic#create'
  post '/subjects/:id/comment' => 'comments#announce_comment'
  get '/subjects/:subject_id/post/:id/edit' => 'topic#edit'
  delete 'subjects/:subject_id/post/:id' => 'topic#delete'
  patch 'subjects/:subject_id/post/:id' => 'topic#update'
  post 'subjects/:subject_id/comment/:post_id' => 'comments#post_comment'
  post 'subjects/:subject_id/reply/:post_id/:id' => 'comments#reply_comment'
end

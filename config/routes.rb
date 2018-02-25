Raw::Application.routes.draw do



	mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

	authenticated :user do
		root :to => 'dashboard#index'
	end
	root :to => "home#index"

devise_for :users, :controllers => {:registrations => "registrations"}
devise_scope :user do
		root :to => "registrations#new"
end

 # devise_for :users
	resources :users
	resources :activities
	resources :phases
	resources :studies
	resources :organizations do
		get :getdata
	end
	resources :statuses
	resources :dashboard
	resources :user_workflow_router
	resources :tasks
	resources :message_actions
	resources :surveys
	resources :strategies
	resources :user_survey_responces, :path => "survey"
end

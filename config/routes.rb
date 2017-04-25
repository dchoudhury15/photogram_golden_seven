Rails.application.routes.draw do
  #create
  get("/create_photo", {:controller => "photos", :action => "create"})
  get("/photos/new", {:controller => "photos", :action => "new_form"})

  #read
  get("/photos/:id_num", {:controller => "photos", :action => "show"})
  get("/photos", {:controller => "photos", :action => "index"})

  #delete
  get("/photos/:id_num/delete", {:controller => "photos", :action => "delete_form"})
  #update
  get("/photos/:id_num/edit", {:controller => "photos", :action => "edit_form"})
  get("/update_photo/:id_num", {:controller => "photos", :action => "update_row"})

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

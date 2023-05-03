Rails.application.routes.draw do

  get("/users", {:controller => "user", :action=> "index"})

  get("/users/:user_id", {:controller =>"user", :action=> "user_detail"})

  get("/photos", {:controller => "photo", :action=>"index"})

  get("/photos/:photo_id", {:controller => "photo", :action=> "photo_detail"})

end

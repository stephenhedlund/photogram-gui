Rails.application.routes.draw do

  get("/", {:controller=>"user", :action=> "index"})

  get("/users", {:controller => "user", :action=> "index"})

  get("/users/:user_id", {:controller =>"user", :action=> "user_detail"})

  get("/photos", {:controller => "photo", :action=>"index"})

  get("/photos/:photo_id", {:controller => "photo", :action=> "photo_detail"})

  get("photos/delete_photo/:goodbye_id", {:controller => "photo", :action=> "bye"})

  get("/insert_photo_record", {:controller => "photo", :action=>"add_photo"})

  get("update_photo/:update_id", {:controller => "photo", :action=>"update_photo"})

  get("/insert_comment_record", {:controller=> "photo", :action=>"new_comment"})

  get("/insert_user_record", {:controller=> "user", :action=> "new_user"})

  get("/update_user/:update_id", {:controller => "user", :action=> "update_user"})

end

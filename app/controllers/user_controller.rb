class UserController<ApplicationController

def index
  total_users = User.all
  @list_of_users = total_users.order({:created_at => "desc"})

  render({:template=> "user_templates/user_index"})
end

def user_detail
  the_username = params.fetch("user_id")

  matching_user = User.where({:username => the_username})
  @the_user = matching_user.at(0)

  render({:template=> "user_templates/user_detail"})
end

def new_user
  the_username = params.fetch("input_username")
  total_users = User.all
  list_of_users = total_users.order({:created_at => "desc"})
  @last_user = list_of_users.maximum(:id)

  new_user = User.new
  new_user.username = the_username

  new_user.save

  # render({:template=> "user_templates/test"})
  redirect_to("/users/" + new_user.username.to_s)

end

def update_user
  the_username = params.fetch("input_username")
  the_id = params.fetch("update_id")

  matching_user = User.where({:id => the_id})

  new_username = matching_user.at(0)

  new_username.username = the_username

  new_username.save

  redirect_to("/users/" + new_username.username.to_s)
end



end

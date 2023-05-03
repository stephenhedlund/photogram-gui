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

end

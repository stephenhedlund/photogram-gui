class PhotoController<ApplicationController

  def index
    total_photos = Photo.all
  @list_of_photos = total_photos.order({:created_at => "desc"})

    render({:template=> "photo_templates/photo_index"})
  end
  
  def photo_detail
    photo_id=params.fetch("photo_id")
    
    matching_photo=Photo.where({:id=> photo_id})
    @the_photo=matching_photo.at(0)



    render({:template=> "photo_templates/photo_detail"})
  end

  def bye
    the_id = params.fetch("goodbye_id")

    matching_photos= Photo.where({:id => the_id})

    the_photo=matching_photos.at(0)

    the_photo.destroy

    # render({ :template=> "photo_templates/bye"})

    redirect_to("/photos")
  end

  def add_photo
    the_image = params.fetch("input_image")
    the_caption = params.fetch("input_caption")
    the_owner_id = params.fetch("input_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = the_image
    a_new_photo.caption = the_caption
    a_new_photo.owner_id = the_owner_id
    a_new_photo.save

    # render({:template=> "photo_templates/add_photo"})

    redirect_to("/photos/" + a_new_photo.id.to_s)

  end

  def update_photo
    the_id = params.fetch("update_id")
    the_image = params.fetch("input_image")
    the_caption = params.fetch("input_caption")

    matching_photos = Photo.where({:id=> the_id})

    the_photo = matching_photos.at(0)

    the_photo.image = the_image
    the_photo.caption = the_caption

    the_photo.save

    redirect_to("/photos/" + the_photo.id.to_s)
  end

  def new_comment
    the_id = params.fetch("input_photo_id")
    the_author = params.fetch("input_author_id")
    the_body = params.fetch("input_body")

    a_new_comment = Comment.new
    a_new_comment.photo_id = the_id
    a_new_comment.body = the_body
    a_new_comment.author_id = the_author
    a_new_comment.save

    redirect_to("/photos/" + a_new_comment.photo_id.to_s)
  end


  end
  
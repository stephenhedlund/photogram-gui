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

  end
  
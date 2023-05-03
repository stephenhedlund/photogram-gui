class PhotoController<ApplicationController

  def index
    total_photos = Photo.all
  @list_of_photos = total_photos.order({:created_at => "desc"})

    render({:template=> "photo_templates/photo_index"})
  end
  
  def photo_detail
    render({:template=> "photo_templates/photo_detail"})
  end

  end
  
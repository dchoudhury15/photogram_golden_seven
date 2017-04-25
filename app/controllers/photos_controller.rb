class PhotosController < ApplicationController
  def index
        @all_photos=Photo.all
        render("photos/index.html.erb")
  end
  def show
    # the params hash looks like this: {"the_id_number" => "1"}

    id_number=params["id_num"]
    p=Photo.find(id_number)

    @the_caption=p.caption
    @the_image_url=p.source
    @last_updated=p.created_at
    render("photos/show.html.erb")
  end
end

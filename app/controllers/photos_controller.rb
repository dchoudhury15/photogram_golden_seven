class PhotosController < ApplicationController
  def create
        #Parameters: {"the_image_url"=>"https://www.google.com/search?q=tuxedo+images&espv=2&biw=1862&bih=930&tbm=isch&imgil=EXvchCXuqFNBQM%253A%253B0ScWSSW73y88-M%253Bhttp%25253A%25252F%25252Fwww.menswearhouse.com%25252Fmens-clothes%25252Fformalwear%25252Ftuxedos%25252Fwilke-rodriguez-black-modern-fit-tuxedo-340D341D10&source=iu&pf=m&fir=EXvchCXuqFNBQM%253A%252C0ScWSSW73y88-M%252C_&usg=__fME2Mx9o-KrB4LBKIjZVImXpzzU%3D", "the_caption"=>"dress up"}

        p=Photo.new
        p.source=params["the_image_url"]
        p.caption=params["the_caption"]
        p.save
        redirect_to("/photos")
  end
  def new_form

        render("photos/new_form.html.erb")
  end
  def index
        @all_photos=Photo.all.order({:created_at => :desc})
        render("photos/index.html.erb")
  end
  def show
    # the params hash looks like this: {"the_id_number" => "1"}

    id_number=params["id_num"]
    @photo=Photo.find(id_number)

    @the_caption=@photo.caption
    @the_image_url=@photo.source
    @last_updated=@photo.created_at
    render("photos/show.html.erb")
  end
  def delete_form
        @delete_photo=Photo.find(params[:id_num])
        @delete_photo.destroy
        redirect_to("/photos")
  end
  def edit_form
        @the_edit_photo=Photo.find(params[:id_num])
        render("photos/edit_form.html.erb")
  end
  def update_row
        p=Photo.find(params[:id_num])
        p.source= params[:the_source]
        p.caption=params[:the_caption]
        p.save

        redirect_to("/photos")
  end
end

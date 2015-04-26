class Admin::ImagesController < Admin::BaseController

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.create(image_params)
    if @image.save
      flash[:success] = "Image was successfully created"
      redirect_to admin_image_path(@image)
    else
      flash[:error] = "Image creation failed"
      render :new
    end
  end

private

def image_params
  params.require(:image).permit(:picture)
end

end
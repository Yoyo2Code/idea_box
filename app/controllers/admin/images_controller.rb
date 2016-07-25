class Admin::ImagesController < Admin::BaseController

  def index
    @images = Image.all
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash.now[:success] = "Category Successfully Created."
      redirect_to admin_images_path
    else
      flash.now[:error] = "Invalid. Try Again."
      render :new
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    redirect_to admin_images_path
  end

  private

  def image_params
    params.require(:image).permit(:url)
  end
end

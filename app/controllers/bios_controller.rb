class BiosController < ApplicationController
  def index
  end

  def show
    @bios = current_user.bios
  end

  def create
    
    @bio = current_user.bios.new(bio_params)
    if @bio.save
      redirect_to user_bio_path
    else
      render :new
    end
  end

  def udpate
    if @bio.update(bio_params)
      redirect_to user_bio_path
    else
      render :edit
    end
  end

  def new
    @bio = Bio.new
    render partial: "form"
  end

  def edit
    @bio = current_user.bios.find(params[:id])
    render partial: "form"
  end

  private
    def bio_params
      params.require(:bio).permit(:profile_image, :description)
    end
end

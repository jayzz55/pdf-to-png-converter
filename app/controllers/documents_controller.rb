class DocumentsController < ApplicationController
  def index
    @documents = Document.order('created_at')
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(photo_params)
    if @document.save
      flash[:success] = "The document was added!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def photo_params
    params.require(:document).permit(:pdf, :title)
  end

end

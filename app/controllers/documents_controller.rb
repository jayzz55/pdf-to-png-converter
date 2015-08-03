class DocumentsController < ApplicationController
  def index
    @documents = Document.order('created_at')
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params) 
    if @document.save
      flash[:success] = "The document was added!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    document = Document.find(params[:id])
    document.destroy_attachments
    if document.destroy
      flash[:success] = "document deleted"
    else
      flash[:danger] = "Unable to delete document"
    end

    redirect_to documents_path
    
  end

  private

  def document_params
    params.require(:document).permit(:asset, :title, :id)
  end

end

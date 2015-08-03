class PagesController < ApplicationController
  def index
    @document = Document.find(params[:id])
    @pages = @document.pages
  end

  private

  def page_params
    params.require(:page).permit(:id)
  end


end

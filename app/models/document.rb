class Document < ActiveRecord::Base

  has_many :pages, dependent: :destroy

  has_attached_file :asset, styles: { thumb: ["64x64", :png] } 

  validates_attachment :asset, content_type: {content_type: ['image/jpeg', 'image/png', 'image/gif', 'application/pdf']}

  # after_pdf_post_process :convert_to_png
  
  process_in_background :asset

  after_asset_post_process :make_pages

  def destroy_attachments
    self.pages.each do |item|
      item.asset = nil
      item.save
    end
    self.asset = nil
    self.save
  end

  private

  def make_pages
    if valid?
      Paperclip.run('convert', "-quality #{Page::QUALITY} -density #{Page::DENSITY} #{asset.queued_for_write[:original].path} #{asset.queued_for_write[:original].path}%d.png")
      images = Dir.glob("#{asset.queued_for_write[:original].path}*.png").sort_by do |line|
        line.match(/(\d+)\.png$/)[1].to_i
      end

      images.each do |page_image|
        pages.build(:asset => File.open(page_image))
      end
      FileUtils.rm images
    end
  end

  def convert_to_png
    # PostProcessUploadJob.perform_now(self.pdf.queued_for_write[:original].path)
  end
end

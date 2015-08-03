require 'byebug'
class Document < ActiveRecord::Base

  has_attached_file :pdf, styles: { thumb: ["64x64", :png] } 
  has_attached_file :image, :styles => { :thumb => ["640x300", :png] }

  validates_attachment :pdf, content_type: {content_type: ['image/jpeg', 'image/png', 'image/gif', 'application/pdf']}
  validates_attachment :image, content_type: {content_type: 'application/pdf'}

  # after_pdf_post_process :convert_to_png

  private

  def convert_to_png
    # PostProcessUploadJob.perform_now(self.pdf.queued_for_write[:original].path)
  end
end

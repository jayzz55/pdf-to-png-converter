require 'byebug'
class Document < ActiveRecord::Base

  has_attached_file :pdf

  validates_attachment :pdf, content_type: {content_type: ['image/jpeg', 'image/png', 'image/gif', 'application/pdf']}

  after_post_process :convert_to_png

  private

  def convert_to_png
    byebug
  end
end

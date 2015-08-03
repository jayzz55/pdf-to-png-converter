class Page < ActiveRecord::Base

  belongs_to :document

  has_attached_file :asset

  validates_attachment :asset, content_type: {content_type: ['image/jpeg', 'image/png', 'image/gif', 'application/pdf']}

  process_in_background :asset

  QUALITY = 100
  DENSITY = '80x80'

end

class Document < ActiveRecord::Base

  has_attached_file :pdf

  validates_attachment :pdf, content_type: {content_type: ['image/jpeg', 'image/png', 'image/gif', 'application/pdf']}

end

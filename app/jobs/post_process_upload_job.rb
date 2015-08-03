class PostProcessUploadJob < ActiveJob::Base
  queue_as :default

  def perform(path)
    document = Document.new(image: File.new(path))
    document.save
  end
end

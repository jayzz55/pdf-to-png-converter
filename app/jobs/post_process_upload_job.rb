class PostProcessUploadJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    # Do something later
    puts args
  end
end

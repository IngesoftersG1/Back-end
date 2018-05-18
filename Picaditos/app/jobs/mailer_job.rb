class MailerJob < ApplicationJob
  queue_as :default
  rescue_from(ErrorLoadingSite) do
    retry_job wait: 5.minutes, queue: :low_priority 
  end

  def perform(*args)
    # Do something later
  end
end

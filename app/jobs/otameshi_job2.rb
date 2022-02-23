class OtameshiJob2 < ApplicationJob
  queue_as :default

  def perform
    puts 'おためし cron2 実行 "cron: * * * * * Asia/Tokyo"'
  end
end

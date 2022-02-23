class OtameshiJob3 < ApplicationJob
  queue_as :default

  def perform
    puts 'おためし cron3 実行 "cron: */5 * * * * Asia/Tokyo"'
  end
end

# https://github.com/moove-it/sidekiq-scheduler#load-the-schedule-from-a-different-file
require 'sidekiq'
require 'sidekiq-scheduler'

Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://127.0.0.1:6379' }
  config.log_formatter = Sidekiq::Logger::Formatters::JSON.new
  config.on(:startup) do
    yaml = YAML.load_file(Rails.root.join('config/sidekiq_scheduler.yml'))
    raise "config/sidekiq-scheduler.yml [#{Rails.env}]" unless yaml.key? Rails.env

    Sidekiq.schedule = yaml[Rails.env]
    SidekiqScheduler::Scheduler.instance.reload_schedule!
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://127.0.0.1:6379' }
end

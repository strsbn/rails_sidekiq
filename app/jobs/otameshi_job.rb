class OtameshiJob < ApplicationJob
  queue_as :default

  def perform(moziretsu)
    puts 'ここに実行job #{moziretsu}'
    puts "ここに実行job #{moziretsu}"
  end
end

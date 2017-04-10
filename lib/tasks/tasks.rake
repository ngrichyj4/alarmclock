namespace :alarmclock do
  desc "Check if browser is in background if not fire it up"
  task :background_watcher => :environment do
    Fetcher.scrape! :jobbank
  end
end
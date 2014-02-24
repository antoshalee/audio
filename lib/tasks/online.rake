namespace :online do
  desc "Refresh speakers' online attributes"
  task :refresh => :environment do
    puts "pending"

    speakers = Speaker.
      where("online_next_refresh < ? OR online_next_refresh IS NULL", Time.now)

    speakers.find_each do |speaker|
      speaker.refresh_online_attribute!
    end

  end
end
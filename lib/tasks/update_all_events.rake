desc 'update all events'
task :update_all_events => :environment do
  Event.update_all_events
end

desc 'update all events'
task :update_all_events => :environment do
  Event.destroy_all
  Event.update_all_events
end

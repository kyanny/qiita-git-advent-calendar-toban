class Event < ActiveRecord::Base
  has_event_calendar

  def name
    self.twitter_id || self.nickname
  end

  def self.update_all_events
    start_date = Time.parse('2012-06-01')
    open('http://api.atnd.org/events/users/?event_id=29378&format=json'){ |f|
      JSON.parse(f.read)['events'][0]['users'].each_with_index do |user, index|
        event = Event.new
        ['twitter_id', 'twitter_img', 'username'].each do |key|
          event.send("#{key}=", user[key])
        end
        event.start_at = start_date.since((index-1).days).beginning_of_day
        event.end_at   = start_date.since((index-1).days).end_of_day
        event.save!
      end
    }
  end
end

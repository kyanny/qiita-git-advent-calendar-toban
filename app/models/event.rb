class Event < ActiveRecord::Base
  has_event_calendar

  def name
    self.twitter_id || self.nickname
  end
end

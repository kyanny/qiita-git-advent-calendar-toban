class CalendarController < ApplicationController
  
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = Event.event_strips_for_month(@shown_month)
  end
  
  def update
    Event.destroy_all
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
    redirect_to :calendar, :notice => 'updated!'
  end
end

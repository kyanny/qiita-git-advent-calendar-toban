class CalendarController < ApplicationController
  
  def index
    @month = (params[:month] || 6).to_i
    @year = (params[:year] || 2012).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = Event.event_strips_for_month(@shown_month)
  end
  
  def update
    Event.destroy_all
    Event.update_all_events
    redirect_to :root, :notice => 'updated!'
  end
end

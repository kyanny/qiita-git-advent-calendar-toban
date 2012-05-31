# -*- coding: utf-8 -*-
module CalendarHelper
  def month_link(month_date)
    link_to(I18n.localize(month_date, :format => "%B"), {:month => month_date.month, :year => month_date.year})
  end
  
  # custom options for this calendar
  def event_calendar_opts
    {
      :height => 600,
      :event_height => 90,
      :year => @year,
      :month => @month,
      :event_strips => @event_strips,
      :month_name_text => I18n.localize(@shown_month, :format => "%B %Y"),
      :previous_month_text => "<< " + month_link(@shown_month.prev_month),
      :next_month_text => month_link(@shown_month.next_month) + " >>"    }
  end

  def event_calendar
    # args is an argument hash containing :event, :day, and :options
    calendar event_calendar_opts do |args|
      event = args[:event]
      html = <<HTML
<div style="float:left; margin:0.1em;">
#{event.url ? event_with_link(event) : event_without_link(event)}
</div>
<div style="float:left; margin:0.1em;">
#{event.url ? remind_link(event) : nil}
</div>
<br style="clear:both" />
HTML
      html
    end
  end

  def event_without_link(event)
    html = <<HTML
<img src="#{event.image_url}" alt="#{event.name}" /><br />
#{h(event.name)}
HTML
    html
  end

  def event_with_link(event)
    html = <<HTML
<a class="user" href="#{event.url}" title="#{event.name}" target="_blank"><img src="#{event.image_url}" alt="#{event.name}" /></a>
<a class="user" href="#{event.url}" title="#{event.name}" target="_blank">#{h(event.name)}</a>
HTML
    html
  end

  def remind_link(event)
    message = "今日の Git Advent Calendar / June 当番は @#{event.name} さんです！どんなエントリを書いてくれるんでしょうか？楽しみですね！ #qiita"
    html = <<HTML
<a class="remind" href="https://twitter.com/home?status=#{URI.escape(message)}" target="_blank">リマインド</a>
HTML
    html
  end
end

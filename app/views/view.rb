class View

  def display_events(events)
    events.each do |event|
      puts "#{event.day.date} at #{event.time} - #{event.name}"
    end
  end

  def display_users(users)
    users.each do |user|
      puts "#{user.name}"
    end
  end

  def display_rsvps(rsvps)
    rsvps.each do |rsvp|
      puts rsvp
    end
  end


  def display_help
puts <<-HELP
Command: - Result:
'agenda' - the agenda for the coming week
'rsvps' - all rsvps
'users' - all users
'day' - events for a particular day
'--help' - user guide

HELP
  end
end

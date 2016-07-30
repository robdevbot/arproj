require_relative 'config/environment.rb'

# Create, read, update and delete:
# users, events, rsvps

# display agenda for the week

# display events for a certain person

# display events that need an RSVP

view = View.new
controller = Controller.new


if ARGV[0] == "agenda"
  view.display_events(controller.get_agenda_for_week)
elsif ARGV[0] == "events"
  view.display_events(controller.get_events_by_name(ARGV[1]))
elsif ARGV[0] == "rsvps"
  view.display_rsvps(controller.get_rsvps_by_name(ARGV[1]))
elsif ARGV[0] == "users"
  view.display_users(controller.get_all_users)
elsif ARGV[0] == "day"
  view.display_events(get_events_by_day(ARGV[0]))
elsif ARGV[0] == "--help"
  view.display_help
end

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
elsif ARGV[0] == "--help"
  view.display_help
end

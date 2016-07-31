class Controller

  def get_all_users
    User.all
  end

  def get_all_events
    Event.all
  end

  def get_all_rsvps
    Rsvp.all
  end

  def get_agenda_for_week
    Event.all
    # one_week_from_now = Date.today + 7.days
    # Event.where(day.date: Date.today)
    #   # ..one_week_from_now)
  end

  def get_rsvps_by_name(name)
    User.find_by_name(name).rsvps
  end

  def get_unresponded_rsvps_by_name(name)
    Rsvp.where(yes_no_maybe: nil)
  end


  def get_events_by_name(name)

  end

  def get_events_by_day(day)
    Event.where
  end

  def get_events_needing_rsvp
  end

end

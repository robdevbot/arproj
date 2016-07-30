class Controller
  def get_agenda_for_week
    Event.all
  end

  def get_rsvps
    Rsvp.all
  end

  def get_events_by_person

  end

  def get_events_needing_rsvp
  end


end

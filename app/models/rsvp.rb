class Rsvp < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  belongs_to :day, through: :event
end

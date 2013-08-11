class Event < ActiveRecord::Base
  attr_accessible :announcement, :end_datetime, :location_id, :organiser, :recap, :serie_id, :start_datetime, :title, :google_plus, :facebook
  belongs_to :serie
  belongs_to :location
end

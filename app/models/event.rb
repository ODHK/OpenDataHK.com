class Event < ActiveRecord::Base
  attr_accessible :announcement, :end_datetime, :location_id, :logo, :organiser, :recap, :serie_id, :start_datetime, :title
  belongs_to :serie
  belongs_to :location
end

module EventsHelper
	def event_image_url event
		"events/#{event.to_s}.png"
	end
end

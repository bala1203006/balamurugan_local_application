module EventsHelper
	def link_to_registration(event_id)
		link_to 'Registration',{:action => "register_for_event", :controller => 'events'},{ :event_id => event_id, data: { confirm: 'Are you sure you want to register ?'}}
	end	
end

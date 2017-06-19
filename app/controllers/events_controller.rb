class EventsController < ApplicationController
	before_action :verify_admin, :only => ["create","new","edit", "update"]
	before_action :verify_user, :only => ["index", "show", "register_for_event"]
	def index
		@events = Event.all
		@events = @events.by_active_status unless session[:role] == "ADMIN"
	end

	def show
		@event = Event.find_by_id(params[:id])
	end

	def create
		@event = Event.new(event_params.merge({:type => params[:type]}))
		if @event.save
			redirect_to root_path, notice: 'Event was successfully created.' 
		end
	end

	def register_for_event
		if session[:user_id] && params[:event_id]
			event = Event.find_by_id(params[:event_id])
			if event
				event.users << User.find_by_id(session[:user_id])
				event.save
			end
	    end
    	redirect_to root_path
	end

	def new
		@event = Event.new
	end	

	def edit
		@event = Event.find_by_id(params[:id])
	end		

	def update
		@event = Event.find_by_id(params[:id])
		if @event.update(event_params.merge({:type => params[:type]}))
			redirect_to root_path, notice: 'Event was successfully updated.' 
		end				
	end

private
	def event_params
		unless params[:event].blank?
     		params.require(:event).permit(:name, :start_date, :end_date, :venue, :country, :city)
     	else
     		params.require(params[:type].downcase.to_sym).permit(:name, :start_date, :end_date, :venue, :country, :city)
     	end
    end
end
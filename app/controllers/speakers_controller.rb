class SpeakersController < ApplicationController
	before_action :verify_admin

	def index
		@speakers = Speaker.all
	end

	def show
		@speaker = Speaker.find_by_id(params[:id])
	end

	def create
		@event = Speaker.new(speaker_params)
		if @event.save
			redirect_to speakers_path, notice: 'speaker was successfully created.' 
		end
	end

	def register_for_event
		if session[:user_id] && params[:event_id]
			event = Speaker.find_by_id(params[:event_id])
			if event
				event.users << Speaker.find_by_id(session[:user_id])
				event.save
			end
	    end
    	redirect_to root_path
	end

	def new
		@speaker = Speaker.new
	end	

	def edit
		@speaker = Speaker.find_by_id(params[:id])
	end		

	def update
		@speaker = Speaker.find_by_id(params[:id])
		if @speaker.update(speaker_params)
			redirect_to speakers_path, notice: 'Speakers was successfully updated.' 
		end				
	end

	def destroy
         @speaker = Speaker.find_by_id(params[:id]) 
         if @speaker.destroy
         redirect_to speakers_path, notice: 'Speakers was successfully deleted.' 
        else
        	redirect_to speakers_path,notice: 'unable to delete the speaker'
	end
end

private
	def speaker_params
		params.require(:speaker).permit(:name)
    end
end

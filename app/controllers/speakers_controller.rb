class SpeakersController < ApplicationController
	before_action :verify_admin

	def index
		#@speakers = Speaker.all
		@speakers=Speaker.all.collect(&:name).uniq.map{|x| Speaker.find_by_name(x)}
	end

	def show
		@speaker = Speaker.find_by_id(params[:id])
	end

	def create
		@speaker = Speaker.new(speaker_params)
		@event=Event.find_by_id(session[:event_id])
		@event.speakers << @speaker
		if @event.save
			redirect_to speakers_path, notice: 'speaker was successfully created.' 
		end
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

    def new_speaker
       @speaker=Speaker.new
    end

    def create_new_speaker
        @speaker=Speaker.new(speaker_params)
       if @speaker.save
       	 redirect_to speakers_path, notice: 'speaker was successfully created.' 
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

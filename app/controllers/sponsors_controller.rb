class SponsorsController < ApplicationController
	#before_action :verify_admin
	before_action :verify_admin

	def index
		@sponsors = Sponsor.all
	end

	def show
		@sponsor = Sponsor.find_by_id(params[:id])
	end

	def create
		@sponsor = Sponsor.new(sponsor_params)
		if @sponsor.save
			redirect_to @sponsors_path, notice: 'speaker was successfully created.' 
		end
	end

	def register_for_event
		if session[:user_id] && params[:sponsor_id]
			sponsor = Sponsor.find_by_id(params[:sponsor_id])
			if sponsor
				sponsor.users << Sponsor.find_by_id(session[:user_id])
				sponsor.save
			end
	    end
    	redirect_to root_path
	end

	def new
		@speaker = Sponsor.new
	end	

	def edit
		@speaker = Sponsor.find_by_id(params[:id])
	end		

	def update
		@speaker = Sponsor.find_by_id(params[:id])
		if @speaker.update(speaker_params)
			redirect_to speakers_path, notice: 'Speakers was successfully updated.' 
		end				
	end

	def destroy
         @speaker = Sponsor.find_by_id(params[:id]) 
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

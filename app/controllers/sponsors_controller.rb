class SponsorsController < ApplicationController
	before_action :verify_admin

	def index
		#@speakers = Speaker.all
		@sponsors=Sponsor.all.collect(&:name).uniq.map{|x| Sponsor.find_by_name(x)}
	end

	def show
		@sponsor = Sponsor.find_by_id(params[:id])
	end

	def create
		@sponsor = Sponsor.new(sponsor_params)
		@event=Event.find_by_id(session[:event_id])
		@event.sponsors << @sponsor
		if @event.save
			redirect_to sponsors_path, notice: 'sponsor was successfully created.' 
		end
	end

		
	def new
		@sponsor = Sponsor.new
	end	

	def edit
		@sponsor = Sponsor.find_by_id(params[:id])
	end		

	def update
		@sponsor = Sponsor.find_by_id(params[:id])
		if @sponsor.update(sponsor_params)
			redirect_to sponsors_path, notice: 'Sponsors was successfully updated.' 
		end				
	end

    def new_sponsor
       @sponsor=Sponsor.new
    end

    def create_new_sponsor
        @sponsor=Sponsor.new(sponsor_params)
       if @sponsor.save
       	 redirect_to sponsors_path, notice: 'sponsor was successfully created.' 
       	end
    end


	def destroy
         @sponsor = Sponsor.find_by_id(params[:id]) 
         if @sponsor.destroy
         redirect_to sponsors_path, notice: 'Sponsors was successfully deleted.' 
        else
        	redirect_to sponsors_path,notice: 'unable to delete the sponsor'
	    end
    end

  private
	def sponsor_params
		params.require(:sponsor).permit(:name)
    end
end

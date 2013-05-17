class MicrobesController < ApplicationController

  def index
    @microbes = Microbe.all
    @microbe = Microbe.new
  end
  	def create
		ap params 
	  @microbe = Microbe.new(params[:microbe])
	  @microbe.user_id = current_user.id
	 
	  if @microbe.save
	      redirect_to current_user 
	  else
	      flash[:error] = "Problem!"
	      redirect_to current_user
	  end
	end
end

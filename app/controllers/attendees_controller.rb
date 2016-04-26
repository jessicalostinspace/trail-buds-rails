class AttendeesController < ApplicationController

  def create
  	Attendee.create(user:User.find_by(facebook_id:params[:facebook_id]), event:Event.find(params[:event_id]))
  end

  def destroy
  	Attendee.where(event:Event.find(params["event_id"]), user:User.where(facebook_id:params[:facebook_id]).first).first.destroy
  end

  def renderAttendeesJSON
  	attendees = Attendee.all
  	render json: attendees 
  end

end

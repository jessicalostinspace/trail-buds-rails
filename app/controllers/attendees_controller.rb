class AttendeesController < ApplicationController

  def create
  	Attendee.create(user:User.find_by(facebook_id:params[:facebook_id]), event:Event.find(params["event_id"]))
  end

  def destroy
  	Attendee.where(event:Event.find(params["event_id"]), user:User.find_by(facebook_id:params[:facebook_id])).first.destroy
  end

end

class AttendeesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    attendees = Attendee.all
    render json: attendees 
  end

  def show
    event = Event.find_by id: params[:id]

    attendeeArray = Array.new

    event.attendees.joins(:user).each { |aten| atenArr<<aten.user.first_name.to_s, aten.user.picture_url.to_s, aten.user.facebook_id.to_s }

    render json: attendeeArray

  end

  def create
    user = User.find_by facebook_id: params[:facebook_id]

    attendee = Attendee.where('user_id = ? AND event_id = ?', user.id , params[:event_id]) 

      if attendee.exists?
        puts "already exists"
      else  
        Attendee.create(user:User.find_by(facebook_id:params[:facebook_id]), event:Event.find(params[:event_id]))
      end
  	
  end

  def destroy
  	Attendee.where(event:Event.find(params["event_id"]), user:User.where(facebook_id:params[:facebook_id]).first).first.destroy
  end

  def renderAttendeesJSON
  	attendees = Attendee.all
  	render json: attendees 
  end

end

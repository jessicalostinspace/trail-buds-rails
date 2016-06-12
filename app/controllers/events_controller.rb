class EventsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    events = Event.all
    render json: events
  end

  def new
  end

  def create

    user = User.find_by params[:facebook_id]

    event = Event.create(host_name: user.first_name, trailName:params[:trailName], latitude:params[:latitude], meetingLocation:params[:meetingLocation], hikeDistance:params[:hikeDistance], elevationGain:params[:elevationGain], hikeLocation:params[:hikeLocation], longitude:params[:longitude], description:params[:description], maxAttendees:params[:maxAttendees], user:User.where(facebook_id:params[:facebook_id]).first, eventDate:params[:eventDate])

    Attendee.create(user:User.where(facebook_id:params[:facebook_id]).first, event:event)

  end

  def update
  end

  def edit
  end

  def destroy
    # Find the single event
    event = Event.find_by id: params[:id]

    # If the host of the event is equal to the User with the facebook params passed in, destroy the event.
    event.destroy if event.user == User.find_by(facebook_id:params[:facebook_id])
  end

  def show

    # When user selects a single event from the All Events table view, we will send the event_id, back to rails
    event = Event.find_by id: params[:id]

    render json: event
  end

  def renderEventsJSON
    events = Event.all
    render json: events
  end

  private
  def event_params
    # user = User.find_by(facebook_id:params)
    #user_id, name, trailName, meetingLocation, hikeDistance, elevationGain, hikeLocation, latitude, longitude, description, maxAttendees
  end
end

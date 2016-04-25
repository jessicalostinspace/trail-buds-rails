class EventsController < ApplicationController
  def index
    render text: "This is the homepage"
  end

  def new
  end

  def create
    event = Event.new(name:params[:name], trailName:params[:trailName], hikeDistance:params[:hikeDistance], elevationGain:params[:elevationGain], hikeLocation:params[:hikeLocation], latitude:params[:latitude], longitude:params[:longitude], description:params[:description], maxAttendees:params[:maxAttendees], eventDate:params[:eventDate], user:User.find_by(facebook_id:params[:facebook_id]))

    if event.save
      # This query adds the host as an attendee of the event  
      Attendee.create(user:User.find_by(facebook_id:params[:facebook_id]), event: event)
      render json: "Event Saved"
    else
      render json: "Event not Saved"
    end

  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
    # When user selects a single event from the All Events table view, we will send the event_id, back to rails
    singleEvent = Event.find(params[:id])
    render json: singleEvent
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

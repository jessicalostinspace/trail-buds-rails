class EventsController < ApplicationController
  def index
  end

  def new
  end

  def create
    # Event.create(event_params)
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
  end

  def renderEventsJSON
    Event.all
    render :json
  end

  private
  def event_params
    # user = User.find_by(facebook_id:params)
    #user_id, name, trailName, meetingLocation, hikeDistance, elevationGain, hikeLocation, latitude, longitude, description, maxAttendees
  end
end

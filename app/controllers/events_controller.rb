class EventsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def index
    text = {"test": "test", "test1": "test1"}
    render json: text
  end

  def new
  end

  def create
    puts "***************"
    puts "Did it get to the create method??? Yes it did..."
    puts "***************"

    # hikeDistanceDecimal = BigDecimal.new(params[:hikeDistance])
    # latitudeDecimal = BigDecimal.new(params[:latitude])
    # longitudeDecimal = BigDecimal.new(params[:longitude])

    # elevationGain = params[:elevationGain]
    # facebook_id = params[:facebook_id]
    # maxAttendees = params[:maxAttendees]

    # elevationGainInt = elevationGain.to_i
    # facebook_idInt = facebook_id.to_i
    # maxAttendeesInt = maxAttendees.to_i

    #Got rid of name and event date for time being for testing purposes
    event = Event.create(trailName:params[:trailName], latitude:params[:latitude], meetingLocation:params[:meetingLocation], hikeDistance:params[:hikeDistance], elevationGain:params[:elevationGain], hikeLocation:params[:hikeLocation], longitude:params[:longitude], description:params[:description], maxAttendees:params[:maxAttendees], user:User.find_by(facebook_id:params[:facebook_id]))

    # Attendee.create(user:User.find_by(facebook_id:facebook_idInt), event: event)

    # event = Event.new(name:params[:name], trailName:params[:trailName], hikeDistance:params[:hikeDistance], elevationGain:params[:elevationGain], hikeLocation:params[:hikeLocation], latitude:params[:latitude], longitude:params[:longitude], description:params[:description], maxAttendees:params[:maxAttendees], eventDate:params[:eventDate], user:User.find_by(facebook_id:params[:facebook_id]))

    # if event.save
    #   # This query adds the host as an attendee of the event  
    #   Attendee.create(user:User.find_by(facebook_id:params[:facebook_id]), event: event)
    #   render json: "Event Saved"
    # else
    #   render json: "Event not Saved"
    # end

  end

  def update
  end

  def edit
  end

  def destroy
    # Find the single event
    event = Event.find(params[:id])

    # If the host of the event is equal to the User with the facebook params passed in, destroy the event.
    event.destroy if event.user == User.find_by(facebook_id:params[:facebook_id])
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

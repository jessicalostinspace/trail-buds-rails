class MessagesController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def index
    messages = Message.all

    render json: messages
  end

  def new
  end

  def show
    user = User.find_by facebook_id: params[:id]
    # user = User.where('facebook_id = ?', params[:facebook_id])

    msgArr = Array.new

    # grabs names and picture urls for table view of messages
    # puts them in msgArray
    Message.where(receiver_id: user.id).select(:sender_id).distinct.each { |mess| msgArr<<[first_name: mess.sender.first_name.to_s,  last_name:  mess.sender.last_name.to_s, picture_url: mess.sender.picture_url.to_s, facebook_id: mess.sender.facebook_id.to_s ]}

    render json: msgArr

  end
 
  def update
  end

  def edit
  end

  def destroy
  end

  def create

    sender = User.find_by facebook_id: params[:sender_id]
    receiver = User.find_by facebook_id: params[:receiver_id]

    Message.create(content: params[:content], receiver_id: receiver.id, sender_id: sender.id, event_id: params[:event_id])

  end

  def chat
    # person that is logged in
    receiver = User.find_by facebook_id: params[:receiver_id]
    #person clicked on message view controller
    sender = User.find_by facebook_id: params[:sender_id]

    puts receiver.id
    puts sender.id 

    chat = Message.where("receiver_id = ? AND sender_id = ?", receiver.id, sender.id)

    render json: chat
  end
end

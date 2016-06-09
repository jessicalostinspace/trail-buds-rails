class MessagesController < ApplicationController
  def index
    messages = Message.all

    render json: messages
  end

  def new
  end

  def show
    user = User.find_by facebook_id: params[:facebook_id]
    # user = User.where('facebook_id = ?', params[:facebook_id])

    # user_ids = Message.where(receiver_id: user.id).select(:sender_id).distinct

    msgArr = Array.new

    # grabs names and picture urls for table view of messages
    # puts them in msgArray
    Message.where(receiver_id: user.id).select(:sender_id).distinct.each { |mess| msgArr<<mess.sender.first_name + " " + mess.sender.last_name + " " + mess.sender.picture_url }

    render json: msgArr

  end

  def update
  end

  def edit
  end

  def destroy
  end

  def create
    message = Message.create(content: params[:content], receiver_id: params[:receiver_id], sender_id: params[:sender_id], event_id: params[:event_id])
  end

  def chat
    user = User.find_by facebook_id: params[:facebook_id]
    sender = User.find_by facebook_id: params[:sender_id]

    chat = Message.where("receiver_id = ? AND sender_id = ?", user.id, sender.id)

    render json: chat
  end
end

class MessagesController < ApplicationController
  def index
  end

  def new
  end

  def show
  
    user = User.where('User.facebook_id = ?', params[:facebook_id])
    messages = Message.joins(:sender, :receiver).where('receiver_id = ?', 2)
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def create
  end
end

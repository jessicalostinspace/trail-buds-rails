class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    # User.create(user_params)
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
  end

  def renderUsersJSON
    User.all
    render :json
  end

  private
  def user_params
  end

end



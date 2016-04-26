class UsersController < ApplicationController

  skip_before_filter :verify_authenticity_token
  
  def index   
    users = User.all
    render json: users

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
    users = User.all
    render json: users
  end

  private
  def user_params
  end

end


 


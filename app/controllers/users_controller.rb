class UsersController < ApplicationController

  skip_before_filter :verify_authenticity_token
  
  def index   
    users = User.all
    render json: users

  end

  def new
  end

  def create
    facebook_id = params[:facebook_id]

      if User.exists?(facebook_id: facebook_id)
        session[user_params]
      else  
        User.create(user_params)
        session[user_params]
      end

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
    params.require(:user).permit(:first_name, :last_name, :email, :facebook_id, :gender, :picture_url, :city, :state, :description, :coverPhotoURL)
  end

end


 


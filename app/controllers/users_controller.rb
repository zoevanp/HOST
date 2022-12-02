class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @rooms = Room.all

    @markers = @rooms.geocoded.map do |room|
      {
        lat: room.latitude,
        lng: room.longitude
      }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:role, :first_name, :last_name, :username, :description, :identity_number, :profile_picture)
  end
end

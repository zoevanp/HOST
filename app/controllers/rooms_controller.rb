class RoomsController < ApplicationController
  before_action :set_room, only: %i[show edit update destroy]

  def index
    @rooms = Room.where(host_id: current_user.id)
  end

  def show
  end

  def new
    if current_user.profile_complete?
      @room = Room.new
    else
      flash[:danger] = 'First, we need more information about yourself. Please fill this form.'
      redirect_to edit_user_path(current_user)
    end
  end

  def create
    @room = Room.new(room_params)
    @room.host_id = current_user.id
    if @room.save
      redirect_to rooms_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to room_path(@room), notice: "Room was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @room.destroy
    redirect_to rooms_path
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:beds, :address, room_pictures: [])
  end
end

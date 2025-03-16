class EntriesController < ApplicationController
  before_action :require_login
  
  def new
    @place = Place.find(params[:place_id])
    @entry = Entry.new
  end
  
  def create
    @place = Place.find(params[:place_id])
    @entry = Entry.new(entry_params)
    @entry.place_id = @place.id
    @entry.user_id = @current_user.id
    
    if @entry.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end
  
  private
  
  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on, :image)
  end
end

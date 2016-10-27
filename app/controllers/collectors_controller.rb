class OwnersController < ApplicationController
  
  def index
    @collectors = Owner.all
  end

  def new
  end

  def create
  end


  def update
  end

  def edit
  end

  def show
    @collector = Owner.find(params[:id])
  end
end
    #this might need to be chaned to user_id? or nah because has one?

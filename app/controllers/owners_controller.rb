require 'byebug'
class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end

  # # def new
  # # end

  # # def create
  # # end


  # def update
  # end

  # def edit
  # end

  def show
    @owner = Owner.find(params[:id])
  end
end
    #this might need to be chaned to user_id? or nah because has one?

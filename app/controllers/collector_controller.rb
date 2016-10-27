class CollectorController < ApplicationController
  def new
  end
  def index
    @collectors = Collector.all
  end

  def create
  end


  def update
  end

  def edit
  end

  def show
    @collector = Collector.find(params[:id])
    #this might need to be chaned to user_id? or nah because has one?
  end
end

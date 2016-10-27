class CollectionsController < ApplicationController
  def new
  end

  def index
    @collections = Collection.all
  end

  def create
  end

  def edit
  end
  
  def update
  end

  def show
    #@collection = Collection.find_by(user_id: current_user)
    @collection = Collection.find(params[:id])
  end
end

class CollectionsController < ApplicationController
  def new
    @user = User.find(current_user)
    @collection = Collection.new
  end

  def index
    @collections = Collection.all
  end

  def create
    @collection = Collection.create(collection_params)

    redirect_to @collection
  end

  def edit
  end

  def update
  end

  def show
    #@collection = Collection.find_by(user_id: current_user)
    @collection = Collection.find(params[:id])
  end

  private

  def collection_params
    {category: params[:collection][:category], owner: Owner.find_by(user_id: current_user.id)}
  end


end

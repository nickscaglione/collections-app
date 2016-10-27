class CollectionsController < ApplicationController
  def new
    @user = User.find(current_user)
    @collection = Collection.new
  end

  def index
    @collections = Collection.all
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.current_user = current_user
    if @collection.save
      redirect_to @collection
    else
      flash[:notice] = @collection.errors.full_messages.first
      render :new
    end
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

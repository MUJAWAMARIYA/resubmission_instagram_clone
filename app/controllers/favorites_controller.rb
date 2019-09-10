class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]

 
  def index
    @favorites = Favorite.all
  end

 
  def show
  end

 
  def new
    @favorite = Favorite.new
  end

  
  def edit
  end

 
  def create
    
    favorite = current_user.favorites.create(post_id: params[:post_id])
    redirect_to posts_url, notice: " #{favorite.post.user.email}'s post has been favorited!!! "
  end

  def update
    respond_to do |format|
      if @favorite.update(favorite_params)
        format.html { redirect_to @favorite, notice: 'Favorite was successfully updated.' }
        format.json { render :show, status: :ok, location: @favorite }
      else
        format.html { render :edit }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to posts_url, notice: " #{favorite.post.user.email}'s post has been favorited!!!! "
  end

  private
   
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_params
      params.require(:favorite).permit(:user_id, :post_id)
    end
end

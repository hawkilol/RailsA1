class FriendshipsController < ApplicationController
  before_action :set_friendship, only: %i[ show edit update destroy ]

  # GET /friendships or /friendships.json
  def index
    @friendships = Friendship.all
  end

  # GET /friendships/1 or /friendships/1.json
  def show
  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # GET /friendships/1/edit
  def edit
  end

  # POST /friendships or /friendships.json
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to '/friends'
    else
      flash[:error] = "Unable to add friend."
      redirect_to '/friends'
    end
  end
  
  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to '/friends'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_friendship
      @friendship = Friendship.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def friendship_params
      params.require(:friendship).permit(:user_id, :friend, :create, :destroy)
  end
end

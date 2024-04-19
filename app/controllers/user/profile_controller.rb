class User::ProfileController < ApplicationController
  before_action :set_user, only: [:follow, :unfollow]
  def show
    @user = User.includes(:followed_users, :following_users).find(params[:id])
    @followers = @user.following_users
    @followees = @user.followed_users
  end

  def follow
    Relationship.create_or_find_by( followee_id: @user.id, follower_id: current_user.id )
    respond_to do |format|
      format.turbo_stream
    end
  end

  def unfollow
    current_user.followed_users.where( followee_id: @user.id, follower_id: current_user.id ).destroy_all
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end
end

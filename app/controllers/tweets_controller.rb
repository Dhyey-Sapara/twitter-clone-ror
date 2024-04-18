class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ edit update destroy ]

  def index
    @tweets = Tweet.preload(:user)
  end

  def new
    @tweet = Tweet.new
  end

  def edit
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path, notice: "Tweet was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweet_url(@tweet), notice: "Tweet was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tweet.destroy!
    redirect_to tweets_url, alert: "Tweet was successfully destroyed."
  end

  private
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    def tweet_params
      params.require(:tweet).permit(:heading, :body, :user_id)
    end
end
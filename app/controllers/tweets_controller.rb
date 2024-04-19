class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ edit update destroy ]
  before_action :redirect_if_not_logged_in, only: %i[ new edit create update destroy ]

  def index
    @tweets = Tweet.includes(:user, tweet_post_attachment: :blob).order(id: :desc)
  end

  def new
    @tweet = Tweet.new
  end

  def edit
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      respond_to do |format|
        format.html { redirect_to tweets_path, status: 201 }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_path, status: 200 }
      format.turbo_stream
    end
  end

  private
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    def tweet_params
      params.require(:tweet).permit(:heading, :body, :user_id, :tweet_post)
    end
end

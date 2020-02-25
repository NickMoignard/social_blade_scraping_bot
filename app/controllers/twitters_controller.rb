class TwittersController < ApplicationController
  before_action :set_twitter, only: [:show, :update, :destroy]

  # GET /twitters
  def index
    @twitters = Twitter.all

    render json: @twitters
  end

  # GET /twitters/1
  def show
    render json: @twitter
  end

  # POST /twitters
  def create
    @twitter = Twitter.new(twitter_params)

    if @twitter.save
      render json: @twitter, status: :created, location: @twitter
    else
      render json: @twitter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /twitters/1
  def update
    if @twitter.update(twitter_params)
      render json: @twitter
    else
      render json: @twitter.errors, status: :unprocessable_entity
    end
  end

  # DELETE /twitters/1
  def destroy
    @twitter.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twitter
      @twitter = Twitter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def twitter_params
      params.require(:twitter).permit(:avg_retweets, :avg_likes, :daily_followers, :monthly_followers, :daily_tweets, :monthly_tweets, :total_tweets, :total_followers, :joined, :bio, :website)
    end
end

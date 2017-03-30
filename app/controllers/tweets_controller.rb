class TweetsController < ApplicationController

    before_action :move_to_index, except: :index


  def index
    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def new
  end

  def create
      Tweet.create(image: tweet_params[:image], text: tweet_params[:text], text2: tweet_params[:text2], text3: tweet_params[:text3], user_id: current_user.id)
    end

    def destroy
      tweet = Tweet.find(params[:id])
      if tweet.user_id == current_user.id
        tweet.destroy
      end
    end

    def show
      @tweet = Tweet.find(params[:id])
      @comments = @tweet.comments.includes(:user)
    end

  private
    def tweet_params
      params.permit(:image, :text, :text2, :text3)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end

    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # def tweet_params
    #   params.require(:tweet).permit(:description, :image)
    # end

  end

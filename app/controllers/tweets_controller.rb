class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def index
    @posts = Tweet.all
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = session[:user_id]
    if @tweet.save
      redirect_to tweets_path
    else
      flash.now[:message] = 'Could not create the tweet'
      render 'new'
    end
  end

  private 

  def tweet_params
    params.require('tweet').permit(:content)
  end
end

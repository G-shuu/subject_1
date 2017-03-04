class TweetsController < ApplicationController
  before_action :tweet_find, only: [:edit, :update, :destroy]
  
  def index
    @tweets = Tweet.all
  end

  def new
   if params[:back]
    @tweet = Tweet.new(tweets_params)
   else
    @tweet = Tweet.new
   end  
  end

  def create
    @tweet = Tweet.new(tweets_params)
    if @tweet.save
     redirect_to tweets_path, notice: "ブログを作成しました！"
    else
     render "new"
    end 
  end

  def edit
  end

  def update
    @tweet.update(tweets_params)
    redirect_to tweets_path, notice: "ブログを更新しました！"
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: "ブログを削除しました！"
  end
  
  def confirm
    @tweet = Tweet.new(tweets_params)
    render "new" if @tweet.invalid?
  end
  
private
    def tweets_params
      params.require(:tweet).permit(:content)
    end
    
    def tweet_find
      @tweet = Tweet.find(params[:id])
    end
end

class UsersController < ApplicationController
  def index
    
  end

  def show
    @user = User.find(params[:id])
    @realname = @user.realname
    @tweets = @user.tweets
  end
end

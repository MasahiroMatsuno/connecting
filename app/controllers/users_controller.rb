class UsersController < ApplicationController
  def index
    
  end

  def show
    @user = User.find(params[:id])
    @realname = current_user.realname
    @tweets = current_user.tweets
  end
end

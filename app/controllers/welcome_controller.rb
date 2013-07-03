class WelcomeController < ApplicationController
  def index
  end

  def user_show

    @user = User.find(params[:id])
    @poems = @user.poems
    @upvotes = @user.votes
  end
end


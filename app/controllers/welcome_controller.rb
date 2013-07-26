class WelcomeController < ApplicationController
  def index
  end

  def user_show
    @user = User.find(params[:id])
    @poems = @user.poems.order('created_at DESC').page(params[:page]).per(15)
    @upvotes = @user.votes.order('created_at DESC').page(params[:page]).per(15)
  end

  def faq
  end
end


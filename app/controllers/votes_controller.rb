class VotesController < ApplicationController

  def create
    if current_user.id == Poem.find(params[:id]).user_id
      redirect_to poems_path, alert: "You can't vote to yourself"
    end

    @vote = Vote.new(user_id: current_user.id, poem_id: params[:id])
    if @vote.save!
      p session[:return_to]
      redirect_to(:back)
    else
      #redirect_to(:back) , alert: @vote.errors.all
    end
  end

  def destroy
    @vote = Vote.find_by(user_id: current_user.id, poem_id: params[:id])
    if @vote.destroy!
      p "hallow"
      redirect_to(:back)
    else
      #redirect_to(:back) , alert: @vote.errors.all
    end

  end
  end


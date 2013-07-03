class VotesController < ApplicationController

  def create
    @vote = Vote.new(user_id: current_user.id, poem_id: params[:id])
    if @vote.save!
      redirect_to poems_path
    else
      redirect_to poems_path, alert: @vote.errors.all
    end
  end

  def destroy
    @vote = Vote.find_by(user_id: current_user.id, poem_id: params[:id])
    if @vote.destroy!
      p "hallow"
      redirect_to poems_path
    else
      redirect_to poems_path , alert: @vote.errors.all
    end

  end

end

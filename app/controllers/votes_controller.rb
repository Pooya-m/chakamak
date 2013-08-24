class VotesController < ApplicationController
  before_filter :not_yourself, only: [:create]
  before_action :prevent_double , only: [:create]

  def create
    @vote = current_user.votes.create(poem_id: params[:id])
    respond_with(@vote , location: request.referer)
  end

  def destroy
    @vote = current_user.votes.find_by(poem_id: params[:id]).destroy!
    respond_with(@vote, location: request.referer)
  end

  private
    def not_yourself
      if current_user.id == Poem.find(params[:id]).user_id
        redirect_to poems_path, alert: "You can't vote to yourself!"
      end
    end

    def prevent_double
      if Vote.exists?(poem_id: params[:id] , user_id: current_user.id)
        redirect_to poems_path , alert: "you can't vote twice!"
      end
    end
end


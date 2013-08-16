class VotesController < ApplicationController
  before_filter :not_yourself, only: [:create]

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
        redirect_to poems_path, alert: "Yoi can't vote to yourself!"
      end
    end
end


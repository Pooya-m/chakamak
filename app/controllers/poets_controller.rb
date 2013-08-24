class PoetsController < ApplicationController
  respond_to :json

  def index
    @poets = Poet.all
    respond_to do |format|
      format.json { render :json => @poets.collect { |p| p.poet_name } }
    end 
  end
end

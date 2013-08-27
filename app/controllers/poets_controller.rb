class PoetsController < ApplicationController
  respond_to :json

  def index
    @poets = Poet.all
    respond_to do |format|
      format.json { render :json => @poets.collect { |p| p.poet_name } }
      format.html
    end 
  end

  def show
    @poet = Poet.find(params[:id])
    @poems = c_paginate(@poet.poems)
    respond_with @poet
  end
end

class PoemsController < ApplicationController

  before_filter :authenticate_user! , except: [:index , :show]
  before_filter :apply_limit , only: [:new , :create]

  def show
    @poem = Poem.find(params[:id])
  end

  def edit
    @poem = current_user.poems.find(params[:id])
  end

  def new
    @poem = Poem.new
  end

  def index
    @title = t(:lastest)
    @poems = Poem.order('created_at DESC').page(params[:page]).per(15)
    if params[:vote] == "true"
      @poems = @poems.order('votes_count DESC') 
      @title = t(:lastest_by_vote)
    end
    p_array(@poems)
  end

  def destroy
    @poem = current_user.poems.find(params[:id])
    @poem.destroy
    respond_with @poem
  end

  def create
    @poem = current_user.poems.new(poem_params) 
    @poem.save
    respond_with @poem
  end

  def update
    @poem = current_user.poems.find(params[:id])
    @poem.update(poem_params)
    respond_with @poem
  end

  private
    def poem_params
      better(params[:poem][:poet_name])
      better(clear(params[:poem][:content]))
      params[:poem].permit(:poet_name , :content , :poet_id)
    end

    def apply_limit
      if has_limit?
        redirect_to poems_path , alert: t(:poem_limit)
      end
    end

end

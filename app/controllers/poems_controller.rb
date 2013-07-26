class PoemsController < ApplicationController

  before_filter :authenticate_user! , except: [:index , :show]
  before_filter :check_limit , only: [:new , :create]

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

    if user_signed_in?  
      @po = current_user.poems.where('DATE(created_at) = ?', Time.now.utc.to_date)
    end

    @poems = Poem.all.page(params[:page]).per(20)
    @vote = false
    
    if params[:vote] == "true"
      @poems.sort! { |a,b| a.votes.count <=> b.votes.count }.reverse!
      @vote = true
    else
      @poems.sort!.reverse!
    end

  end

  def destroy

    @poem = Poem.find(params[:id])

    if @poem.user_id == current_user.id
      @poem.destroy
      redirect_to poems_path
    else
      redirect_to poems_path, alert: "You cannot delete this poem!"
    end

  end

  def create
    @poet = Poet.find_or_initialize_by_poet_name(params[:poem][:poet_name])
    @poet.save!
  
    @poem = Poem.new(poet_name: params[:poem][:poet_name] , content: clear(params[:poem][:content]), poet_id: @poet.id , user_id: current_user.id)
    
    if @poem.save
      redirect_to @poem
    else
      render 'new'
    end

  end

  def update

    @poet = Poet.find_or_initialize_by_poet_name(params[:poem][:poet_name])
    @poet.save!

    @poem = current_user.poems.find(params[:id])
    if @poem.update(poet_name: params[:poem][:poet_name] , content: clear(params[:poem][:content]) , poet_id: @poet.id)
      redirect_to @poem
    else
      render 'edit'
    end

  end

end

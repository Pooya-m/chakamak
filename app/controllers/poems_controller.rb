class PoemsController < ApplicationController

  before_filter :authenticate_user!

  def show
    @poem = Poem.find(params[:id])
  end

  def edit
    @poem = Poem.find(params[:id])
  end

  def new
    @poem = Poem.new
  end

  def index

    @poems = Poem.all
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

    @poem = Poem.new(params[:poem].permit(:poet_name, :content))
    @poet = Poet.find_or_initialize_by_poet_name(@poem.poet_name)
    @poet.save
    @poem.poet_id = @poet.id
    @poem.user_id = current_user.id
    @poem.content.gsub! "\n", "            "
    @poem.content.gsub! "\r", "            "

    if @poem.save
      redirect_to @poem
    else
      render 'new'
    end

  end

  def update

    @poem = Poem.find(params[:id])

    if @poem.update(params[:poem].permit(:poet_name, :content))
      redirect_to @poem
    else
      render 'edit'
    end

  end

end
